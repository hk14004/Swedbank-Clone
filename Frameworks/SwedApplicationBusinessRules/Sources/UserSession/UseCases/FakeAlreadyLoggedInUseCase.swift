//
//  FakeAlreadyLoggedInUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol FakeAlreadyLoggedInUseCase {
    func use() -> AnyPublisher<Void, Never>
}

public struct DefaultFakeAlreadyLoggedInUseCase: FakeAlreadyLoggedInUseCase {
    
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
    
    public func use() -> AnyPublisher<Void, Never> {
        .just(())
    }
    
    public func use2() -> AnyPublisher<Void, Never> {
        customerRepository.replace(with: [JAMES_BOND])
            .flatMap { _ in
                startSessionService.use(
                    input: StartSessionServiceInput(username: "emilys", password: "emilyspass")
                )
                .map { response -> Void in
                    userSessionCredentialsRepository.save(
                        credentials: UserSessionCredentials(
                            id: JAMES_BOND.id,
                            authorizationData: UserSessionCredentials.Data(
                                bearerToken: response.bearerToken,
                                refreshToken: response.refreshToken,
                                bearerTokenExpirationDate: generateExpirationDate(mins: response.expirationDurationInMins)
                            )
                        )
                    )
                    return ()
                }
                .catch { error in
                    Just(())
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func generateExpirationDate(mins: Int) -> Date {
        let now = Date()
        let newDate = Calendar.current.date(byAdding: .minute, value: mins, to: now)
        return newDate ?? now
    }
}

let JAMES_BOND = Customer(
    id: "007",
    displayName: "James Bond",
    type: .private,
    hasIpRestriction: false,
    hasUsableAccounts: true,
    sortOrder: 0,
    roles: [.private],
    authorities: [],
    isMain: true
)
