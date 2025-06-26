//
//  DefaultLoginUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol PinLoginUseCase {
    func use(customerID: String, pinCode: String) -> AnyPublisher<Customer, Error>
}

public struct DefaultPinLoginUseCase: PinLoginUseCase {
    private let startSessionService: StartSessionService
    private let sessionManager: UserSessionManager
    private let userSessionCredentialsRepository: UserSessionCredentialsRepository
    private let customerRepository: CustomerRepository
    
    public init(
        startSessionService: StartSessionService,
        manager: UserSessionManager,
        userSessionCredentialsRepository: UserSessionCredentialsRepository,
        customerRepository: CustomerRepository
    ) {
        self.startSessionService = startSessionService
        self.sessionManager = manager
        self.userSessionCredentialsRepository = userSessionCredentialsRepository
        self.customerRepository = customerRepository
    }
    
    public func use(customerID: String, pinCode: String) -> AnyPublisher<Customer, Error> {
        // Fetch tokens
        startSessionService.use(
            input: .init(customerID: customerID, pinCode: pinCode)
        )
        .flatMap { response -> AnyPublisher<Customer, Error> in
            // Save creds
            let creds = UserSessionCredentials(
                id: response.userID,
                authorizationData: .init(
                    bearerToken: response.bearerToken,
                    refreshToken: response.refreshToken
                )
            )
            userSessionCredentialsRepository.save(credentials: creds)
            // Fetch customers
            return customerRepository.getRemoteCustomers()
                .flatMap { customersOutput -> AnyPublisher<(selected: Customer, all: [Customer]), Error> in
                    // Find customer
                    guard let customer = customersOutput.first(where: {$0.id == customerID}) else {
                        return .fail(NSError(domain: "No user found", code: 0))
                    }
                    return .just((selected: customer, all: customersOutput))
                        .eraseToAnyPublisher()
                }
                .flatMap { customersOutput -> AnyPublisher<Customer, Error> in
                    // Store customers
                    customerRepository.addOrUpdate(customersOutput.all)
                        .flatMap { _ -> AnyPublisher<Customer, Error> in
                            // Start user session
                            sessionManager.startUserSession(with: creds)
                            // Return to caller the selected customer
                            return .just(customersOutput.selected)
                        }
                        .eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
