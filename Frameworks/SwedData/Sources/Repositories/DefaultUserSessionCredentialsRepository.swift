//
//  DefaultUserSessionCredentialsRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import SwedApplication
import DevToolsCore
import SwedPersistance

public class DefaultUserSessionCredentialsRepository: UserSessionCredentialsRepository {
    let store: any SwedUserSessionCredentialsStore
    
    public init(store: any SwedUserSessionCredentialsStore) {
        self.store = store
    }
    
    public func save(credentials: UserSessionCredentials) {
        store.storeCredentials(credentials)
    }
    
    public func getCredentials(id: String) -> UserSessionCredentials? {
        store.getCredentials(id: id)
    }
    
    public func deleteCredentials(id: String) {
        store.deleteCredentials(id: id)
    }
}
