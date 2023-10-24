//
//  UserSessionCredentialsRepository.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

class MockUserSessionCredentialsRepository: UserSessionCredentialsRepository {
    
    var saveCalledSpy: (()->())?
    func save(credentials: UserSessionCredentials) {
        saveCalledSpy?()
    }
    
    var getCalledSpy: ((String)->())?
    var getMockResult: UserSessionCredentials!
    func get(id: String) -> UserSessionCredentials {
        getCalledSpy?(id)
        return getMockResult
    }
    
    var deleteCalledSpy: ((String)->())?
    func delete(id: String) {
        deleteCalledSpy?(id)
    }

}
