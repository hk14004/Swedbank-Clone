//
//  UpdateOnboardingStatusUseCaseTests+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
@testable import Application

extension UpdateOnboardingStatusUseCaseTests {
    final class Mocks {
        let mockUserJourneyRepository = MockUserJourneyRepository()
    }
}

extension UpdateOnboardingStatusUseCaseTests {
    func makeSUT() -> DefaultUpdateOnboardingStatusUseCase {
        DefaultUpdateOnboardingStatusUseCase(
            userJourneyRepository: mocks.mockUserJourneyRepository
        )
    }
}
