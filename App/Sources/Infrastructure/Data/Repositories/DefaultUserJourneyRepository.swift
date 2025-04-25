//
//  DefaultUserJourneyRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules
import SwiftyUserDefaults

class DefaultUserJourneyRepository: UserJourneyRepository {
    
    private let defaultsStore: DefaultsAdapter<DefaultsKeys>
    
    init(defaultsStore: UserDefaults = UserDefaults.standard) {
        self.defaultsStore = DefaultsAdapter<DefaultsKeys>(
            defaults: defaultsStore,
            keyStore: .init()
        )
    }
    
    func update(completedOnboarding: Bool) {
        defaultsStore[\.isOnboardingCompleted] = completedOnboarding
    }
    
    func getIsOnboardingCompleted() -> Bool {
        defaultsStore[\.isOnboardingCompleted]
    }
}
