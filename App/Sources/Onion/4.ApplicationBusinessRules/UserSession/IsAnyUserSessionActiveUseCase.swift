//
//  IsUserSessionActiveUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol IsAnyUserSessionActiveUseCase {
    func use() -> Bool
}

struct DefaultIsAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase {
        
    private let userSessionManager: UserSessionManager
    
    init(userSessionManager: UserSessionManager) {
        self.userSessionManager = userSessionManager
    }
    
    func use() -> Bool {
        userSessionManager.isSomebodyLoggedIn()
    }
}
