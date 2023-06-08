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
    
    // MARK: Types
    
    typealias UserSessionType = SwedbankUserSession
    typealias CredentialsStoreType = SwedbankUserSessionCredentialsStore
    typealias UserSessionFactoryType = SwedbankUserSessionFactory
    
    // MARK: Properties
    
    private(set) var credentialsStore: SwedbankUserSessionCredentialsStore
    private(set) var userSessionFactory: SwedbankUserSessionFactory
    private var startedUserSessions: [String: SwedbankUserSession] = [:]
    
    // MARK: init
    
    init(credentialsStore: SwedbankUserSessionCredentialsStore, userSessionFactory: SwedbankUserSessionFactory) {
        self.credentialsStore = credentialsStore
        self.userSessionFactory = userSessionFactory
    }
    
}

// MARK: UserSessionManager

extension SwedbankUserSessionManager: UserSessionManager {
    func startAllUserSessions() {
        let creds = credentialsStore.getAllCredentials()
        creds.forEach { cred in
            let session = userSessionFactory.makeUserSession(with: cred)
            startedUserSessions[cred.id] = session
        }
    }
    
    func startUserSession(withCredentialsID id: String) {
        guard let cred = credentialsStore.getCredentials(id: id) else {
            return
        }
        let session = userSessionFactory.makeUserSession(with: cred)
        startedUserSessions[cred.id] = session
    }
    
    func stopUserSession(forCredentialsID id: String) {
        startedUserSessions.removeValue(forKey: id)
    }
    
    func deleteUserSession(credentialsID: String) {
        stopUserSession(forCredentialsID: credentialsID)
        credentialsStore.deleteCredentials(id: credentialsID)
    }
    
    func getStartedUserSession(forCredentialsID id: String) -> SwedbankUserSession? {
        return startedUserSessions[id]
    }
    
    func isSomebodyLoggedIn() -> Bool {
        return !startedUserSessions.keys.isEmpty
    }
}
