//
//  MockUserSessionManager.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore

class MockUserSessionManager: UserSessionManager {
    
    var isSomebodyLoggedInMock: Bool!
    var isSomebodyLoggedInCalledSpy: (()->())?
    override func isSomebodyLoggedIn() -> Bool {
        isSomebodyLoggedInCalledSpy?()
        return isSomebodyLoggedInMock
    }
    
    init() {
        let credentialsStore = BaseUserSessionCredentialsStore<UserSessionCredentials>()
        let userSessionFactory = BaseUserSessionFactory<UserSessionCredentials>()
        super.init(credentialsStore: credentialsStore, userSessionFactory: userSessionFactory)
    }
}
