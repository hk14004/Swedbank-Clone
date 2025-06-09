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
                StartSessionDataOutgoing(customerID: input.customerID, pinCode: input.pinCode)
            )
        )
    }
}
