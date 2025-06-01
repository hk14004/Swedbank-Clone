//
//  StartAllUserSessionsUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol StartAllUserSessionsUseCase {
    func use()
}

public struct DefaultStartAllUserSessionsUseCase: StartAllUserSessionsUseCase {

    private let manager: UserSessionManager
    
    public init(manager: UserSessionManager) {
        self.manager = manager
    }
    
    public func use() {
        manager.startAllUserSessions()
    }
}
