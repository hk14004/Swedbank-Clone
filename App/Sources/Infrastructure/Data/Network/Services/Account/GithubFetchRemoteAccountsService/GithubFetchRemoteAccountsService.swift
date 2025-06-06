//
//  GithubFetchRemoteAccountsService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 27/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplicationBusinessRules

class GithubFetchRemoteAccountsService: FetchRemoteAccountsService {
    
    // MARK: Properties
    private let networkClient: SwedNetworkClient
    
    // MARK: Lifecycle
    init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: Methods
    func use() -> AnyPublisher<FetchRemoteAccountsServiceOutput, Never> {
        fetchResponse()
            .map { response in
                response.compactMap { responseItems in
                    try? responseItems.mapToDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<GithubAccountsResponse, Never> {
        networkClient.execute(AccountRequestConfig.fetchAccounts)
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
}
