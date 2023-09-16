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
        
    }
    
    func get(id: String) -> UserSessionCredentials {
        .init(id: id, authorizationData: .init(bearerToken: "bear", refreshToken: "refresh"))
    }
    
    func delete(id: String) {
        
    }
}
