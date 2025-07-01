import Foundation
import SwedApplicationBusinessRules
import DevToolsNetworking
import Combine

class SwedNetworkClient: BaseNetworkClient {
    // MARK: Properties
    let credentialsStore: any SwedUserSessionCredentialsStore
    let currentCustomerStore: CurrentCustomerStore
    
    // MARK: LifeCycle
    init(
        dataProvider: DevNetworkDataProvider,
        requestFactory: DevNetworkRequestFactory,
        credentialStore: any SwedUserSessionCredentialsStore,
        currentCustomerStore: CurrentCustomerStore
    ) {
        self.credentialsStore = credentialStore
        self.currentCustomerStore = currentCustomerStore
        super.init(dataProvider: dataProvider, requestFactory: requestFactory)
    }
    
    // MARK: Methods
    override func prepareRequest(requestConfig: DevRequestConfig) -> AnyPublisher<URLRequest, Error> {
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
        guard
            let currentCustomer = currentCustomerStore.getCurrentCustomer(),
            let credentials = credentialsStore.getCredentials(id: currentCustomer.id)
        else {
            return .fail(UserSessionError.missingCredentals)
        }
        if credentials.isValid {
            return .just(credentials)
        } else {
            return renewCredentials(credentials)
        }
    }
    
    private func renewCredentials(_ credentials: UserSessionCredentials) -> AnyPublisher<UserSessionCredentials, Error> {
        fetchRemoteAccessToken(credentials.authorizationData.refreshToken)
            .map { response in
                let credentials = UserSessionCredentials(
                    id: credentials.id,
                    authorizationData: UserSessionCredentials.Data(
                        bearerToken: response.accessToken,
                        refreshToken: response.refreshToken,
                        bearerTokenExpirationDate: self.generateExpirationDate(mins: TOKEN_EXPIRE_TIME_IN_MINS)
                    )
                )
                self.credentialsStore.storeCredentials(credentials)
                return credentials
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchRemoteAccessToken(
        _ refreshToken: String
    ) -> AnyPublisher<RefreshSessionServiceOutput, Error> {
        let request = requestFactory.urlRequest(
            requestConfig: SessionRequestConfig.refreshToken(
                RefreshSessionServiceInput(
                    refreshToken: refreshToken,
                    expiresInMins: TOKEN_EXPIRE_TIME_IN_MINS
                )
            ),
            authorizationHeaders: nil
        )
        return dataProvider.output(for: request)
            .decode(when: request)
            .eraseToAnyPublisher()
    }
    
    private func generateExpirationDate(mins: Int) -> Date {
        let now = Date()
        let newDate = Calendar.current.date(byAdding: .minute, value: mins, to: now)
        return newDate ?? now
    }
}

extension SwedNetworkClient: DevAuthorizationHeaderProvider {
    func getAuthorizationHeaders() -> AnyPublisher<[String : String]?, Error> {
        validAuthCredentials()
            .map { self.makeBearerAuthHeader(token: $0.authorizationData.bearerToken) }
            .eraseToAnyPublisher()
    }
}
