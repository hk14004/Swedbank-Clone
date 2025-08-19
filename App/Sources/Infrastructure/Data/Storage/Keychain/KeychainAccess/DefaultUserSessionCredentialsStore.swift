//
//  DefaultUserSessionCredentialsStore.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsCore
import KeychainAccess
import Foundation
import SwedApplication


public protocol SwedUserSessionCredentialsStore: UserSessionCredentialsStore where CredentialsType == UserSessionCredentials {}

class DefaultUserSessionCredentialsStore: SwedUserSessionCredentialsStore {

    // MARK: Properties
    
    private let keychain: Keychain
    
    // MARK: init
    
    init(keychain: Keychain) {
        self.keychain = keychain
    }
    
    // MARK: Overriden
    
    func storeCredentials(_ credentials: UserSessionCredentials) {
        guard let data = try? JSONEncoder().encode(credentials) else {
            deleteCredentials(id: credentials.id)
            return
        }
        try? keychain.set(data, key: credentials.id)
    }
    
    func getCredentials(id: String) -> UserSessionCredentials? {
        guard let data = try? keychain.getData(id) else {
            deleteCredentials(id: id)
            return nil
        }
        let decoded = try? JSONDecoder().decode(UserSessionCredentials.self, from: data)
        return decoded
    }
    
    func getAllCredentials() -> [UserSessionCredentials] {
        let result: [UserSessionCredentials] = keychain.allKeys().compactMap { credID in
            getCredentials(id: credID)
        }
        return result
    }
    
    func deleteCredentials(id: String) {
        try? keychain.remove(id)
    }
    
    func deleteAllCredentials() {
        try? keychain.removeAll()
    }
}
