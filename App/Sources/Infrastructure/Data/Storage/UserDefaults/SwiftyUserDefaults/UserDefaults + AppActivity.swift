//
//  UserDefaults + UserJourney.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftyUserDefaults
import Foundation

public extension DefaultsKeys {
    var appLaunchDate: DefaultsKey<Date?> { .init("appLaunchDate", defaultValue: nil) }
    var appTerminationDate: DefaultsKey<Date?> { .init("appTerminationDate", defaultValue: nil) }
}
