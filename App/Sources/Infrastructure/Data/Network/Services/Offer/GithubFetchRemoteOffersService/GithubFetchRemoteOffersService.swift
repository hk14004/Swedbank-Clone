//
//  MockFetchRemoteOffersService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 27/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplicationBusinessRules

class GithubFetchRemoteOffersService: FetchRemoteOffersService {
    // MARK: Properties
    private let networkClient: SwedNetworkClient
    
    // MARK: Lifecycle
    init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: Methods
    var mockResult: AnyPublisher<FetchRemoteOffersServiceOutput, Never>!
    func use() -> AnyPublisher<FetchRemoteOffersServiceOutput, Never> {
        fetchResponse()
            .map { response in
                response.compactMap { responseItems in
                    try? responseItems.mapToOffer()
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<GithubOffersResponse, Never> {
        networkClient.execute(OrderRequestConfig.fetchOrders)
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
}
