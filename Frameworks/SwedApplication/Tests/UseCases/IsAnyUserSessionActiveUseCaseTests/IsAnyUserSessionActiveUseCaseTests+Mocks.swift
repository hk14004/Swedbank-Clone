//
//  IsAnyUserSessionActiveUseCaseTests+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
@testable import SwedApplication

extension IsAnyUserSessionActiveUseCaseTests {
    final class Mocks {
        let mockUserSessionManager = MockUserSessionManager()
    }
}

extension IsAnyUserSessionActiveUseCaseTests {
    func makeSUT() -> DefaultIsAnyUserSessionActiveUseCase {
        DefaultIsAnyUserSessionActiveUseCase(
            userSessionManager: mocks.mockUserSessionManager
        )
    }
}
