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
}

extension UserSessionError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidLoginCredentials:
            return "Login attempt with invalid credentials was made"
        }
    }
}
