//
//  DefaultUserJourneyRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

class DefaultUserJourneyRepository: UserJourneyRepository {
    func update(completedOnboarding: Bool) {
        
    }
    
    func getCompletedOnboarding() -> Bool {
        return true
    }
}
