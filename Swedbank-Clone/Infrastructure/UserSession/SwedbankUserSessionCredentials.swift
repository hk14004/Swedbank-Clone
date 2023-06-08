//
//  SwedbankUserSessionCredentials.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import Foundation
import DevToolsCore

struct SwedbankUserSessionCredentials: AuthorizationCredentials {
    
    // MARK: Types
    
    struct Data: Codable {
        let bearerToken: String
    }
    
    // MARK: Properties
    
    var id: String
    var authorizationData: Data
    
}

extension SwedbankUserSessionCredentials: Codable {}
