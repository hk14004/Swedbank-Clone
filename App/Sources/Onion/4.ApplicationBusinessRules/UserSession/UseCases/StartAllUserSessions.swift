//
//  StartAllUserSessionsUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol StartAllUserSessionsUseCase {
    func use()
}

struct DefaultStartAllUserSessionsUseCase: StartAllUserSessionsUseCase {

    private let manager: UserSessionManager
    
    init(manager: UserSessionManager) {
        self.manager = manager
    }
    
    func use() {
        manager.startAllUserSessions()
    }
}
