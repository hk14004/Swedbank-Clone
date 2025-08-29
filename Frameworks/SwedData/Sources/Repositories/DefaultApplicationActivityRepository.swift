//
//  DefaultApplicationActivityRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import SwedApplication
import SwedPersistance

public class DefaultApplicationActivityRepository: ApplicationActivityRepository {
    private let defaultsStore: DefaultsAdapter<DefaultsKeys>
    
    public init(defaultsStore: UserDefaults = UserDefaults.standard) {
        self.defaultsStore = DefaultsAdapter<DefaultsKeys>(
            defaults: defaultsStore,
            keyStore: .init()
        )
    }
    
    public func getLaunchDate() -> Date? {
        defaultsStore[\.appLaunchDate]
    }
    
    public func saveLaunchDate(date: Date?) {
        defaultsStore[\.appLaunchDate] = date
    }
    
    public func getTerminationDate() -> Date? {
        defaultsStore[\.appTerminationDate]
    }
    
    public func saveTerminationDate(date: Date?) {
        defaultsStore[\.appTerminationDate] = date
    }
}
