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
    
    private let startSessionService: StartSessionService
    private let manager: UserSessionManager
    private let fetchCustomerService: FetchCustomerService
    private let userSessionCredentialsRepository: UserSessionCredentialsRepository
    
    public init(
        startSessionService: StartSessionService,
        manager: UserSessionManager,
        fetchCustomerService: FetchCustomerService,
        userSessionCredentialsRepository: UserSessionCredentialsRepository
    ) {
        self.startSessionService = startSessionService
        self.manager = manager
        self.fetchCustomerService = fetchCustomerService
        self.userSessionCredentialsRepository = userSessionCredentialsRepository
    }
    
    public func use(username: String, password: String) -> AnyPublisher<CustomerDTO, Error> {
        // Fetch tokens
        startSessionService.use(
            input: .init(
                username: username,
                password: password
            )
        )
        .flatMap { response -> AnyPublisher<CustomerDTO, Error> in
            // Save creds
            let creds = UserSessionCredentials(
                id: response.userID,
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
                return Just(customerResponse.customer).setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }.eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
