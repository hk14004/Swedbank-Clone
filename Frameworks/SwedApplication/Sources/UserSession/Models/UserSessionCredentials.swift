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
        public var bearerTokenExpirationDate: Date
        
        public init(
            bearerToken: String,
            refreshToken: String,
            bearerTokenExpirationDate: Date
        ) {
            self.bearerToken = bearerToken
            self.refreshToken = refreshToken
            self.bearerTokenExpirationDate = bearerTokenExpirationDate
        }
        
        public init(
            bearerToken: String,
            refreshToken: String,
            bearerTokenExpiresInSecs: Int
        ) {
            self.bearerToken = bearerToken
            self.refreshToken = refreshToken
            let expDate = Calendar.current.date(byAdding: .second, value: bearerTokenExpiresInSecs, to: Date())
            self.bearerTokenExpirationDate = expDate ?? Date()
        }
    }
    
    // MARK: Properties
    
    public var id: String
    public var authorizationData: Data
    public var isValid: Bool {
        return Date() < authorizationData.bearerTokenExpirationDate
    }
    
    // MARK: LifeCycle
    
    public init(id: String, authorizationData: Data) {
        self.id = id
        self.authorizationData = authorizationData
    }
}
