//
//  ApplicationFlagRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol UserJourneyRepository {
    func update(completedOnboarding: Bool)
    func getIsOnboardingCompleted() -> Bool
}
