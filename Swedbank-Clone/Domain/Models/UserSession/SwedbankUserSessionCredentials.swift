//
//  SwedbankUserSessionCredentials.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import Foundation
import DevToolsCore

struct SwedbankUserSessionCredentials: Codable, AuthorizationCredentials {
    
    // MARK: Types
    
    struct Data: Codable {
        var bearerToken: String
        var refreshToken: String
    }
    
    // MARK: Properties
    
    var id: String
    var authorizationData: Data
}
