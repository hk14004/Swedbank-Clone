import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules
import Foundation

class DefaultStartSessionService: StartSessionService {
    private let networkClient: SwedNetworkClient
    
    init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use(input: StartSessionServiceInput) -> AnyPublisher<StartSessionServiceOutput, Error> {
        fetchResponse(input: input)
            .flatMap { response -> AnyPublisher<StartSessionServiceOutput, Error> in
                    .just(response.mapToDomain())
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse(input: StartSessionServiceInput) -> AnyPublisher<StartSessionResponse, Error> {
        networkClient.execute(
            SessionRequestConfig.startSession(
                StartSessionDataOutgoing(
                    username: input.username,
                    password: input.password,
                    expiresInMins: TOKEN_EXPIRE_TIME_IN_MINS
                )
            )
        )
        .mapError { error in
            guard let networkError = error as? NetworkError else {
                return error
            }
            switch networkError {
            case .resourceNotFound:
                return UserSessionError.invalidLoginCredentials
            default:
                return error
            }
        }
        .eraseToAnyPublisher()
    }
}
