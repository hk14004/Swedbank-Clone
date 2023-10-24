//
//  MockUserJourneyRepository.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

class MockUserJourneyRepository: UserJourneyRepository {
    
    var updateOnboardingCalledSpy: ((Bool) -> ())?
    func update(completedOnboarding: Bool) {
        updateOnboardingCalledSpy?(completedOnboarding)
    }
    
    var getCompletedOnboardingMock: Bool!
    var getCompletedOnboardingCalledSpy: (()->())?
    func getIsOnboardingCompleted() -> Bool {
        getCompletedOnboardingCalledSpy?()
        return getCompletedOnboardingMock
    }
}
