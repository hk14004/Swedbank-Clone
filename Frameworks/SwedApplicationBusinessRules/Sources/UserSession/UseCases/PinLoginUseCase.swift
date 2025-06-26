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
    func use(customerID: String, pinCode: String) -> AnyPublisher<Void, Error>
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
    
    public func use(customerID: String, pinCode: String) -> AnyPublisher<Void, Error> {
        // Fetch tokens
        startSessionService.use(
            input: .init(customerID: customerID, pinCode: pinCode)
        )
        .flatMap { response -> AnyPublisher<Void, Error> in
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
            sessionManager.startUserSession(with: creds)
            return .just(())
        }
        .eraseToAnyPublisher()
    }
}
