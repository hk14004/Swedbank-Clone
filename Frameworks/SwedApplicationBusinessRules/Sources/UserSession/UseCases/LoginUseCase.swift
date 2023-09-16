//
//  StartAllUserSessionsUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol LoginUseCase {
    func use(username: String, password: String) -> AnyPublisher<CustomerDTO, Error>
}

public struct DefaultLoginUseCase: LoginUseCase {
    
    private let fetchCredentialsService: FetchCredentialsService
    private let manager: UserSessionManager
    private let fetchCustomerService: FetchCustomerService
    private let userSessionCredentialsRepository: UserSessionCredentialsRepository
    
    public init(
        fetchCredentialsService: FetchCredentialsService,
        manager: UserSessionManager,
        fetchCustomerService: FetchCustomerService,
        userSessionCredentialsRepository: UserSessionCredentialsRepository
    ) {
        self.fetchCredentialsService = fetchCredentialsService
        self.manager = manager
        self.fetchCustomerService = fetchCustomerService
        self.userSessionCredentialsRepository = userSessionCredentialsRepository
    }
    
    public func use(username: String, password: String) -> AnyPublisher<CustomerDTO, Error> {
        // Fetch token
        fetchCredentialsService.use(
            input: .init(
                username: username,
                password: password
            )
        )
        .flatMap { response -> AnyPublisher<CustomerDTO, Error> in
            // Save creds
            let creds = UserSessionCredentials(
                id: username,
                authorizationData: .init(
                    bearerToken: response.bearerToken,
                    refreshToken: response.refreshToken
                )
            )
            userSessionCredentialsRepository.save(credentials: creds)
            // Fetch customer
            return fetchCustomerService.use(
                input: .init(customerID: username)
            )
            .flatMap { customerResponse -> AnyPublisher<CustomerDTO, Error> in
                // Start session
                manager.startUserSession(with: creds)
                return Just(customerResponse.data).setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }.eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
