//
//  GithubFetchRemoteAccountsService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 27/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplication

public class GithubFetchRemoteAccountsService: FetchRemoteAccountsService {
    
    // MARK: Properties
    private let networkClient: SwedNetworkClient
    
    // MARK: Lifecycle
    public init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: Methods
    public func use() -> AnyPublisher<FetchRemoteAccountsServiceOutput, Error> {
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
