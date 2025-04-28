import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules
import Foundation

class DefaultStartSessionService: StartSessionService {
    private let networkClient: DevNetworkClient
    
    init(networkClient: DevNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use(input: StartSessionServiceInput) -> AnyPublisher<StartSessionServiceOutput, Error> {
        fetchResponse(input: input)
            .flatMap { response -> AnyPublisher<StartSessionServiceOutput, Error> in
                    .just(
                        StartSessionServiceOutput(
                            bearerToken: response.accessToken,
                            refreshToken: response.refreshToken,
                            expirationDuration: response.accessTokenExpirationDuration,
                            userID: response.userID
                        )
                    )
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse(input: StartSessionServiceInput) -> AnyPublisher<StartSessionResponse, Error> {
        networkClient.execute(
            SessionRequestConfig.startSession(
                StartSessionDataOutgoing(
                    username: input.username,
                    password: input.password
                )
            )
        )
    }
}

class MockStartSessionService: StartSessionService {
    func use(input: StartSessionServiceInput) -> AnyPublisher<StartSessionServiceOutput, Error> {
        guard input.username == "007" else {
            return .fail(NSError(domain: "invalid credentials", code: 0))
        }
        return .just(
            StartSessionServiceOutput(
                bearerToken: "accessToken123",
                refreshToken: "refreshToken123",
                expirationDuration: 3600,
                userID: input.username
            )
        )
        .delay(for: .seconds(0.5), scheduler: RunLoop.main, options: .none)
        .eraseToAnyPublisher()
    }
}
