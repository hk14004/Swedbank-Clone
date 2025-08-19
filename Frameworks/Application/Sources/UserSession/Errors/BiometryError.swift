//
//  BiometryError.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 25/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import LocalAuthentication

public enum BiometryError: Error, Equatable {
    case biometryNotAvailable
    case underlyingError(LAError)
    
}

extension BiometryError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .biometryNotAvailable:
            return "Biometry is not available for this device"
        case .underlyingError:
            return "System error"
        }
    }
}
