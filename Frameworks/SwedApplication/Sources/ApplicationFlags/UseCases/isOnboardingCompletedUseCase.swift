//
//  isAppsFirstLaunchUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol isOnboardingCompletedUseCase {
    func use() -> Bool
}

public struct DefaultIsOnboardingCompletedUseCase: isOnboardingCompletedUseCase {
    
    private let userJourneyRepository: UserJourneyRepository
    
    public init(userJourneyRepository: UserJourneyRepository) {
        self.userJourneyRepository = userJourneyRepository
    }
    
    public func use() -> Bool {
        userJourneyRepository.getIsOnboardingCompleted()
    }
    
}
