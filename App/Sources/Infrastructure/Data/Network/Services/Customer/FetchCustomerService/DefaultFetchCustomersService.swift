import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules

class DefaultFetchCustomersService: FetchRemoteCustomersService {
    private let networkClient: DevNetworkClient
    
    init(networkClient: DevNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        fetchResponse()
            .flatMap { response -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> in
                let transformed = response.map { responseCustomer in
                    CustomerDTO(id: responseCustomer.id, displayName: responseCustomer.displayName)
                }
                return .just(transformed)
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<FetchCustomersResponse, Error> {
        networkClient.execute(
            CustomerRequestConfig.fetchCustomers
        )
    }
}

class MockFetchCustomerService: FetchRemoteCustomersService {
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        .just([JAMES_BOND])
    }
}
