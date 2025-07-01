import Combine
import DevToolsNetworking
import SwedApplicationBusinessRules
import Foundation

class DefaultRefreshSessionService: RefreshSessionService {
    private let dataProvider: DevNetworkDataProvider
    private let requestFactory: DevNetworkRequestFactory
    
    init(
        dataProvider: DevNetworkDataProvider,
        requestFactory: DevNetworkRequestFactory
    ) {
        self.dataProvider = dataProvider
        self.requestFactory = requestFactory
    }
    
    func use(input: RefreshSessionServiceInput) -> AnyPublisher<RefreshSessionServiceOutput, Error> {
        fetchResponse(input: input)
    }
    
    private func fetchResponse(input: RefreshSessionServiceInput) -> AnyPublisher<RefreshSessionServiceOutput, Error> {
        let request = requestFactory.urlRequest(
            requestConfig: SessionRequestConfig.refreshToken(input),
            authorizationHeaders: nil
        )
        return dataProvider.output(for: request)
            .decode(when: request)
            .eraseToAnyPublisher()
    }
}
