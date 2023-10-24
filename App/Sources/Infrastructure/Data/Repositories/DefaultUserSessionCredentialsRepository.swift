//
//  DefaultUserSessionCredentialsRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

class DefaultUserSessionCredentialsRepository: UserSessionCredentialsRepository {
    func save(credentials: UserSessionCredentials) {
        fatalError()
    }
    
    func getCredentials(id: String) -> UserSessionCredentials? {
        fatalError()
    }
    
    func deleteCredentials(id: String) {
        fatalError()
    }
}
