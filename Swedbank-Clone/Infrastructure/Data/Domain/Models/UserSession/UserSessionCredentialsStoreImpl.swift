//
//  SwedbankUserSessionCredentialsStore.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import DevToolsCore
import KeychainAccess
import Foundation

class UserSessionCredentialsStoreImpl: BaseUserSessionCredentialsStore<SwedbankUserSessionCredentials> {

    // MARK: Properties
    
    private let keychain = Keychain(service: LOCAL_MAIN_KEYCHAIN_CREDENTIAL_SERVICE)
    
    // MARK: init
    
    override init() {
        super.init()
    }
    
    // MARK: Overriden
    
    override func storeCredentials(_ credentials: SwedbankUserSessionCredentials) {
        guard let data = try? JSONEncoder().encode(credentials) else {
            deleteCredentials(id: credentials.id)
            return
        }
        try? keychain.set(data, key: credentials.id)
    }
    
    override func getCredentials(id: String) -> SwedbankUserSessionCredentials? {
        guard let data = try? keychain.getData(id) else {
            deleteCredentials(id: id)
            return nil
        }
        let decoded = try? JSONDecoder().decode(SwedbankUserSessionCredentials.self, from: data)
        return decoded
    }
    
    override func getAllCredentials() -> [SwedbankUserSessionCredentials] {
        let result: [SwedbankUserSessionCredentials] = keychain.allKeys().compactMap { credID in
            getCredentials(id: credID)
        }
        return result
    }
    
    override func deleteCredentials(id: String) {
        try? keychain.remove(id)
    }
    
    override func deleteAllCredentials() {
        try? keychain.removeAll()
    }
}
