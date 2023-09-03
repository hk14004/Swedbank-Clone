//
//  isAppsFirstLaunchUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol UpdateOnboardingStatusUseCase {
    func use(completed: Bool)
}

struct DefaultUpdateOnboardingStatusUseCase: UpdateOnboardingStatusUseCase {
    
    private let userJourneyRepository: UserJourneyRepository
    
    init(userJourneyRepository: UserJourneyRepository) {
        self.userJourneyRepository = userJourneyRepository
    }
    
    func use(completed: Bool) {
        userJourneyRepository.update(completedOnboarding: completed)
    }
    
}
