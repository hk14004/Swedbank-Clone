import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules

class DefaultFetchCredentialsService: FetchCredentialsService {
    private let networkClient: DevNetworkClient
    
    init(networkClient: DevNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use(input: FetchCredentialsServiceInput) -> AnyPublisher<FetchCredentialsServiceOutput, Error> {
        fetchResponse(input: input)
            .flatMap { response -> AnyPublisher<FetchCredentialsServiceOutput, Error> in
                    .just(
                        FetchCredentialsServiceOutput(
                            bearerToken: response.accessToken,
                            refreshToken: response.refreshToken,
                            expirationDuration: response.accessTokenExpirationDuration
                        )
                    )
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse(input: FetchCredentialsServiceInput) -> AnyPublisher<FetchCredentialsResponse, Error> {
        networkClient.execute(
            FetchCredentialsRequestConfig.login(
                FetchCredentialsLoginOutgoing(
                    username: input.username,
                    password: input.password
                )
            )
        )
    }
}
