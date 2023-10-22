//
//  GetCompletedOnboardingUseCaseTests+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
@testable import SwedApplicationBusinessRules

extension GetCompletedOnboardingUseCaseTests {
    final class Mocks {
        let mockUserJourneyRepository = MockUserJourneyRepository()
    }
}

extension GetCompletedOnboardingUseCaseTests {
    func makeSUT() -> DefaultGetCompletedOnboardingUseCase {
        DefaultGetCompletedOnboardingUseCase(
            userJourneyRepository: mocks.mockUserJourneyRepository
        )
    }
}
