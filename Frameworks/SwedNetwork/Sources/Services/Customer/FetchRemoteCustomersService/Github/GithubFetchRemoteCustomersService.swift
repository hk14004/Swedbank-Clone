import Combine
import DevToolsNetworking
import SwedApplication

public class GithubFetchRemoteCustomersService: FetchRemoteCustomersService {
    private let networkClient: SwedNetworkClient
    
    public init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    public func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        fetchResponse()
            .tryMap { response in
                try response.map { try $0.mapToDomain() }
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<Response, Error> {
        networkClient.execute(CustomerRequestConfig.fetchCustomers)
    }
}
