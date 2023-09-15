//
//  UserSessionCredentials.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore

public struct UserSessionCredentials: Codable, AuthorizationCredentials {
    
    // MARK: Types
    
    public struct Data: Codable {
        public var bearerToken: String
        public var refreshToken: String
    }
    
    // MARK: Properties
    
    public var id: String
    public var authorizationData: Data
}
