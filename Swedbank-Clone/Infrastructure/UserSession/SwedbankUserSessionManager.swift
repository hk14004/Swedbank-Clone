//
//  SwedbankUserSessionManager.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import Foundation
import DevToolsCore

class SwedbankUserSessionManager {
    
}

// MARK: UserSessionManager

extension SwedbankUserSessionManager: UserSessionManager {
    func startup() {
        
    }
    
    func startUserSession(_ userSession: SwedbankUserSession) {
        
    }
    
    func stopUserSession(_ userSession: SwedbankUserSession) {
        
    }
    
    func getStartedUserSession(credentialsID id: String) -> SwedbankUserSession? {
        return nil
    }
    
    func isSomebodyLoggedIn() -> Bool {
        return false
    }
    
    func storeCredentials(_ credentials: SwedbankUserSessionCredentials) {
        
    }
    
    func getCredentials(id: String) -> SwedbankUserSessionCredentials? {
        return nil
    }
    
    func deleteCredentials(id: String) {
        
    }
}
