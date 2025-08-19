//
//  DefaultNetworkClientCredentialsPlugin.swift
//  SwedbankApp
//
//  Created by Hardijs on 19/08/2025.
//  Copyright © 2025 Swedbank. All rights reserved.
//

import Foundation
import SwedNetwork
import SwedApplication

class DefaultNetworkClientCredentialsPlugin: NetworkClientCredentialsPlugin {
    
    private let credentialsStore: any SwedUserSessionCredentialsStore
    
    init(credentialsStore: any SwedUserSessionCredentialsStore) {
        self.credentialsStore = credentialsStore
    }
    
    func storeCredentials(_ credentials: UserSessionCredentials) {
        credentialsStore.storeCredentials(credentials)
    }
    
    func getCredentials(id: String) -> UserSessionCredentials? {
        credentialsStore.getCredentials(id: id)
    }
    
    func getAllCredentials() -> [UserSessionCredentials] {
        credentialsStore.getAllCredentials()
    }
    
    func deleteCredentials(id: String) {
        credentialsStore.deleteCredentials(id: id)
    }
    
    func deleteAllCredentials() {
        credentialsStore.deleteAllCredentials()
    }
}
