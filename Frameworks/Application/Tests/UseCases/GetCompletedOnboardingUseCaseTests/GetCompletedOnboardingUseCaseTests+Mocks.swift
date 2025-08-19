//
//  GetCompletedOnboardingUseCaseTests+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
@testable import Application

extension GetCompletedOnboardingUseCaseTests {
    final class Mocks {
        let mockUserJourneyRepository = MockUserJourneyRepository()
    }
}

extension GetCompletedOnboardingUseCaseTests {
    func makeSUT() -> DefaultIsOnboardingCompletedUseCase {
        DefaultIsOnboardingCompletedUseCase(
            userJourneyRepository: mocks.mockUserJourneyRepository
        )
    }
}
