//
//  DefaultApplicationActivityRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

class DefaultApplicationActivityRepository: ApplicationActivityRepository {
    func getLastOpenDate() -> Date? {
        return nil
    }
    
    func saveLastOpenDate(date: Date?) {
        return
    }
    
    func getLastCloseDate() -> Date? {
        return nil
    }
    
    func saveLastCloseDate(date: Date?) {
        return
    }
    
    
}
