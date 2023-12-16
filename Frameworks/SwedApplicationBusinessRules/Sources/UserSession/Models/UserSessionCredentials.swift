//
//  UserSessionCredentials.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore

public struct UserSessionCredentials: Codable, Equatable, AuthorizationCredentials {
    
    // MARK: Types
    
    public struct Data: Codable, Equatable {
        public var bearerToken: String
        public var refreshToken: String
        
        public init(bearerToken: String, refreshToken: String) {
            self.bearerToken = bearerToken
            self.refreshToken = refreshToken
        }
    }
    
    // MARK: Properties
    
    public var id: String
    public var authorizationData: Data
    
    public init(id: String, authorizationData: Data) {
        self.id = id
        self.authorizationData = authorizationData
    }
}
