//
//  MockApplicationActivityRepository.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

class MockApplicationActivityRepository: ApplicationActivityRepository {
    
    var getLaunchDateMock: Date?
    func getLaunchDate() -> Date? {
        getLaunchDateMock
    }
    
    var saveLaunchDateCalledSpy: ((Date?)->())?
    func saveLaunchDate(date: Date?) {
        saveLaunchDateCalledSpy?(date)
    }
    
    var getTerminationDateCalledSpy: (()->())?
    var getTerminationDateMock: Date?
    func getTerminationDate() -> Date? {
        getTerminationDateCalledSpy?()
        return getTerminationDateMock
    }
    
    var saveTerminationDateCalledSpy: ((Date?)->())?
    func saveTerminationDate(date: Date?) {
        saveTerminationDateCalledSpy?(date)
    }
}
