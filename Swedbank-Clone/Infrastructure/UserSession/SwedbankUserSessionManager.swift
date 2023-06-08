//
//  SwedbankUserSessionManager.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import Foundation
import DevToolsCore

// TODO: Add generic constraints?
class SwedbankUserSessionManager {
    
    typealias UserSessionType = SwedbankUserSession
    typealias CredentialsStoreType = SwedbankUserSessionCredentialsStore
    typealias UserSessionFactoryType = SwedbankUserSessionFactory
    
    private(set) var credentialsStore: SwedbankUserSessionCredentialsStore
    private(set) var userSessionFactory: SwedbankUserSessionFactory
    
    init(credentialsStore: SwedbankUserSessionCredentialsStore, userSessionFactory: SwedbankUserSessionFactory) {
        self.credentialsStore = credentialsStore
        self.userSessionFactory = userSessionFactory
    }
}

// MARK: UserSessionManager

extension SwedbankUserSessionManager: UserSessionManager {
    func startAllUserSessions() {
        
    }
    
    func startUserSession(withCredentialsID id: String) {
        
    }
    
    func stopUserSession(forCredentialsID id: String) {
        
    }
    
    func deleteUserSession(credentialsID: String) {
        
    }
    
    func getStartedUserSession(forCredentialsID id: String) -> SwedbankUserSession? {
        return nil
    }
    
    func isSomebodyLoggedIn() -> Bool {
        return false
    }
}
