//
//  DefaultUserJourneyRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import SwiftyUserDefaults

public class DefaultUserJourneyRepository: UserJourneyRepository {
    
    private let defaultsStore: DefaultsAdapter<DefaultsKeys>
    
    public init(defaultsStore: UserDefaults = UserDefaults.standard) {
        self.defaultsStore = DefaultsAdapter<DefaultsKeys>(
            defaults: defaultsStore,
            keyStore: .init()
        )
    }
    
    public func update(completedOnboarding: Bool) {
        defaultsStore[\.isOnboardingCompleted] = completedOnboarding
    }
    
    public func getIsOnboardingCompleted() -> Bool {
        defaultsStore[\.isOnboardingCompleted]
    }
}
