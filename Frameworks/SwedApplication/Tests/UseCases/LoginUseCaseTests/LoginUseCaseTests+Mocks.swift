//
//  LoginUseCaseTests+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
@testable import SwedApplication

extension LoginUseCaseTests {
    final class Mocks {
        let mockLoginService = MockLoginService()
        let mockUserSessionManager = MockUserSessionManager()
        let mockFetchCustomerService = MockFetchCustomerService()
        let mockUserSessionCredentialsRepository = MockUserSessionCredentialsRepository()
    }
}

extension LoginUseCaseTests {
    func makeSUT() -> DefaultPinAuthenticateUseCase {
        DefaultPinAuthenticateUseCase(
            startSessionService: mocks.mockLoginService,
            manager: mocks.mockUserSessionManager,
            fetchCustomerService: mocks.mockFetchCustomerService,
            userSessionCredentialsRepository: mocks.mockUserSessionCredentialsRepository
        )
    }
}
