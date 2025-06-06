import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules

class DefaultFetchCustomersService: FetchRemoteCustomersService {
    private let networkClient: SwedNetworkClient
    
    init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        fetchResponse()
            .flatMap { response -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> in
                let transformed = response.map { responseCustomer in
                    try! responseCustomer.mapToDomain()
                }
                return .just(transformed)
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<FetchCustomersResponse, Error> {
        networkClient.execute(CustomerRequestConfig.fetchCustomers)
    }
}
