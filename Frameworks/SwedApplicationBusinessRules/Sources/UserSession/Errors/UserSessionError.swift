//
//  UserSessionError.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 09/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation

public enum UserSessionError: Error, Equatable {
    case invalidLoginCredentials
    case missingCredentals
    case expiredSession
}

extension UserSessionError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidLoginCredentials:
            "Login attempt with invalid credentials was made"
        case .missingCredentals:
            "User must be logged out"
        case .expiredSession:
            "Refresh token expired, user must be logged out"
        }
    }
}
