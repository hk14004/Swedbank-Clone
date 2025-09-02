import Foundation
import SwedApplication
import DevToolsNetworking
import Combine

public final class SwedNetworkClient: BaseNetworkClient {
    // MARK: Properties
    private let credentialsPlugin: () -> any NetworkClientCredentialsPlugin
    private let sessionExpiredPlugin: () -> NetworkClientSessionExpiredPlugin
    private let refreshQueue = DispatchQueue(label: "SwedNetworkClient.refresh.credentials.queue")
    private var inProgressCredentialsRenew: AnyPublisher<UserSessionCredentials, Error>?
    
    // MARK: LifeCycle
    public init(
        dataProvider: DevNetworkDataProvider,
        requestFactory: DevNetworkRequestFactory,
        reachabilityNotifier: NetworkReachability,
        credentialsPlugin:  @escaping () -> any NetworkClientCredentialsPlugin,
        sessionExpiredPlugin: @escaping () -> NetworkClientSessionExpiredPlugin
    ) {
        self.credentialsPlugin = credentialsPlugin
        self.sessionExpiredPlugin = sessionExpiredPlugin
        super.init(
            dataProvider: dataProvider,
            requestFactory: requestFactory,
            reachabilityNotifier: reachabilityNotifier
        )
    }
    
    // MARK: Override
    public override func prepareRequest(requestConfig: DevRequestConfig) -> AnyPublisher<URLRequest, Error> {
        guard requestConfig.requiresAuthorization else {
            return super.prepareRequest(requestConfig: requestConfig)
        }
        return getAuthorizationHeaders()
            .map { authorizationHeaders in
                self.requestFactory.urlRequest(
                    requestConfig: requestConfig,
                    authorizationHeaders: authorizationHeaders
                )
            }
            .eraseToAnyPublisher()
    }
}

// MARK: Access token
extension SwedNetworkClient {
    private func validAuthCredentials() -> AnyPublisher<UserSessionCredentials, Error> {
        guard let credentials = credentialsPlugin().getAllCredentials().first else {
            return .fail(UserSessionError.missingCredentals)
        }
        if credentials.isValid {
            return .just(credentials)
        } else {
            return renewCredentials(credentials)
        }
    }
    
    private func renewCredentials(_ credentials: UserSessionCredentials) -> AnyPublisher<UserSessionCredentials, Error> {
        let newPublisher: AnyPublisher<UserSessionCredentials, Error> = refreshedAccessToken(credentials.authorizationData.refreshToken)
            .map { response in
                UserSessionCredentials(
                    id: credentials.id,
                    authorizationData: .init(
                        bearerToken: response.accessToken,
                        refreshToken: credentials.authorizationData.refreshToken,
                        bearerTokenExpiresInSecs: response.expiresIn
                    )
                )
            }
            .handleEvents(
                receiveOutput: { [weak self] newCreds in
                    guard let self = self else { return }
                    self.refreshQueue.async {
                        self.credentialsPlugin().storeCredentials(newCreds)
                    }
                },
                receiveCompletion: { [weak self] _ in
                    self?.refreshQueue.async { self?.inProgressCredentialsRenew = nil }
                },
                receiveCancel: { [weak self] in
                    self?.refreshQueue.async { self?.inProgressCredentialsRenew = nil }
                }
            )
            .share()
            .eraseToAnyPublisher()
        
        return refreshQueue.sync {
            if let running = inProgressCredentialsRenew {
                return running
            }
            inProgressCredentialsRenew = newPublisher
            return newPublisher
        }
    }
    
    private func refreshedAccessToken(
        _ refreshToken: String
    ) -> AnyPublisher<RefreshSessionServiceOutput, Error> {
        let request = requestFactory.urlRequest(
            requestConfig: SessionRequestConfig.refreshToken(
                RefreshSessionServiceInput(
                    refreshToken: refreshToken
                )
            ),
            authorizationHeaders: nil
        )
        return dataProvider.output(for: request)
            .decode(when: request)
            .mapError { receivedError in
                guard
                    let networkError = receivedError as? NetworkError,
                    networkError != .reachability
                else {
                    return receivedError
                }
                return UserSessionError.expiredSession
            }
            .delay(
                whenError: { receivedError in
                    guard let error = receivedError as? UserSessionError else {
                        return false
                    }
                    return error == .expiredSession
                },
                until: Deferred { self.sessionExpiredPlugin().handleSessionExpired() }
            )
            .eraseToAnyPublisher()
    }
}

extension SwedNetworkClient: DevAuthorizationHeaderProvider {
    public func getAuthorizationHeaders() -> AnyPublisher<[String : String]?, Error> {
        validAuthCredentials()
            .map { self.makeBearerAuthHeader(token: $0.authorizationData.bearerToken) }
            .eraseToAnyPublisher()
    }
}
