//
//  DefaultApplicationActivityRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

class DefaultApplicationActivityRepository: ApplicationActivityRepository {
    func getLaunchDate() -> Date? {
        return nil
    }
    
    func saveLaunchDate(date: Date?) {
        return
    }
    
    func getTerminationDate() -> Date? {
        return nil
    }
    
    func saveTerminationDate(date: Date?) {
        return
    }
    
    
}
