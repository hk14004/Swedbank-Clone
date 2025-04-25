//
//  UserDefaults + UserJourney.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftyUserDefaults

public extension DefaultsKeys {
    var isOnboardingCompleted: DefaultsKey<Bool> { .init("isOnboardingCompleted", defaultValue: false) }
}
