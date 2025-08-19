//
//  GithubFetchRemoteAccountsService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 27/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import Application

class GithubFetchRemoteAccountsService: FetchRemoteAccountsService {
    
    // MARK: Properties
    private let networkClient: SwedNetworkClient
    
    // MARK: Lifecycle
    init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: Methods
    func use() -> AnyPublisher<FetchRemoteAccountsServiceOutput, Error> {
        fetchResponse()
            .tryMap { response in
                try response.map { try $0.mapToDomain() }
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<GithubAccountsResponse, Error> {
        networkClient.execute(AccountRequestConfig.fetchAccounts)
    }
}
