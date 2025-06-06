//
//  StartAllUserSessionsUseCase+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
@testable import SwedApplicationBusinessRules

extension StartAllUserSessionsUseCaseTests {
    final class Mocks {
        let mockUserSessionManager = MockUserSessionManager()
    }
}

extension StartAllUserSessionsUseCaseTests {
    func makeSUT() -> DefaultStartAllUserSessionsUseCase {
        DefaultStartAllUserSessionsUseCase(
            manager: mocks.mockUserSessionManager
        )
    }
}
