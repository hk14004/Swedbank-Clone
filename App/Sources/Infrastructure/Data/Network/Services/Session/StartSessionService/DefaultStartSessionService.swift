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
                StartSessionDataOutgoing(customerID: input.customerID, pinCode: input.pinCode)
            )
        )
    }
}
