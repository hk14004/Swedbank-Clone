import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules

class DefaultLoginService: LoginService {
    private let networkClient: DevNetworkClient
    
    init(networkClient: DevNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use(input: LoginServiceInput) -> AnyPublisher<LoginServiceOutput, Error> {
        fetchResponse(input: input)
            .flatMap { response -> AnyPublisher<LoginServiceOutput, Error> in
                    .just(
                        LoginServiceOutput(
                            bearerToken: response.accessToken,
                            refreshToken: response.refreshToken,
                            expirationDuration: response.accessTokenExpirationDuration
                        )
                    )
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse(input: LoginServiceInput) -> AnyPublisher<LoginResponse, Error> {
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
