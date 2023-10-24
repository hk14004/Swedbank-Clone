import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules

class DefaultLoginService: StartSessionService {
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
                            expirationDuration: response.accessTokenExpirationDuration
                        )
                    )
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse(input: StartSessionServiceInput) -> AnyPublisher<LoginResponse, Error> {
        networkClient.execute(
            LoginRequestConfig.login(
                BasicLoginInfoOutgoing(
                    username: input.username,
                    password: input.password
                )
            )
        )
    }
}

class MockLoginService: StartSessionService {
    private let networkClient: DevNetworkClient
    
    init(networkClient: DevNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use(input: StartSessionServiceInput) -> AnyPublisher<StartSessionServiceOutput, Error> {
        .just(
            StartSessionServiceOutput(
                bearerToken: "token",
                refreshToken: "refresh token",
                expirationDuration: 9999
            )
        )
    }
}
