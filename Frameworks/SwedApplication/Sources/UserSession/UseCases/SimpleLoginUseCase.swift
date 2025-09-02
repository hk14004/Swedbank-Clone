//
//  SimpleLoginUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol SimpleLoginUseCase {
    func use(username: String, password: String) -> AnyPublisher<Void, Error>
}

public struct DefaultSimpleLoginUseCase: SimpleLoginUseCase {
    let customerRepository: CustomerRepository
    let startSessionService: StartSessionService
    let userSessionCredentialsRepository: UserSessionCredentialsRepository
    
    public init(
        customerRepository: CustomerRepository,
        startSessionService: StartSessionService,
        userSessionCredentialsRepository: UserSessionCredentialsRepository
    ) {
        self.customerRepository = customerRepository
        self.startSessionService = startSessionService
        self.userSessionCredentialsRepository = userSessionCredentialsRepository
    }
    
    public func use(username: String, password: String) -> AnyPublisher<Void, Error> {
        startSessionService.use(
            input: StartSessionServiceInput(username: username, password: password)
        )
        .map { response -> Void in
            userSessionCredentialsRepository.save(
                credentials: UserSessionCredentials(
                    id: username,
                    authorizationData: UserSessionCredentials.Data(
                        bearerToken: response.bearerToken,
                        refreshToken: response.refreshToken,
                        bearerTokenExpiresInSecs: response.expirationDurationInSecs
                    )
                )
            )
            return ()
        }
        .flatMap { _ in
            self.customerRepository.getRemoteCustomers()
                .map { fetched in
                    customerRepository.setCurrentCustomer(fetched.first!)
                    return fetched.first!
                }
                .eraseToAnyPublisher()
                .mapToVoid()
                
        }
        .eraseToAnyPublisher()
        .mapToVoid()
        .eraseToAnyPublisher()
    }
}
