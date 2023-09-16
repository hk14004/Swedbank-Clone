import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules

class DefaultFetchCustomerService: FetchCustomerService {
    private let networkClient: DevNetworkClient
    
    init(networkClient: DevNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use(input: FetchCustomerServiceInput) -> AnyPublisher<FetchCustomerServiceOutput, Error> {
        fetchResponse(input: input)
            .flatMap { response -> AnyPublisher<FetchCustomerServiceOutput, Error> in
                    .just(
                        FetchCustomerServiceOutput(
                            customer: CustomerDTO(
                                id: response.id,
                                name: response.name,
                                surname: response.surname
                            )
                        )
                    )
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse(input: FetchCustomerServiceInput) -> AnyPublisher<FetchCustomerResponse, Error> {
        networkClient.execute(
            FetchCustomerRequestConfig.fetch(
                FetchCustomerServiceOutgoing(
                    customerId: input.customerID
                )
            )
        )
    }
}
