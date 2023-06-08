//
//  SwedbankUserSessionCredentialsStore.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import DevToolsCore

class SwedbankUserSessionCredentialsStore: UserSessionCredentialsStore {
    typealias CredentialsType = SwedbankUserSessionCredentials
    
    func storeCredentials(_ credentials: SwedbankUserSessionCredentials) {
        
    }
    
    func getCredentials(id: String) -> SwedbankUserSessionCredentials? {
        return nil
    }
    
    func getAllCredentials() -> [SwedbankUserSessionCredentials] {
        return []
    }
    
    func deleteCredentials(id: String) {
        
    }
    
    func deleteAllCredentials() {
        
    }
}
