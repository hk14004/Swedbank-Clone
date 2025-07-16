//
//  DefaultUserSessionCredentialsRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import SwedApplicationBusinessRules
import DevToolsCore

class DefaultUserSessionCredentialsRepository: UserSessionCredentialsRepository {
    let store: any SwedUserSessionCredentialsStore
    
    init(
        store: any SwedUserSessionCredentialsStore
    ) {
        self.store = store
    }
    
    func save(credentials: UserSessionCredentials) {
        store.storeCredentials(credentials)
    }
    
    func getCredentials(id: String) -> UserSessionCredentials? {
        store.getCredentials(id: id)
    }
    
    func deleteCredentials(id: String) {
        store.deleteCredentials(id: id)
    }
}
