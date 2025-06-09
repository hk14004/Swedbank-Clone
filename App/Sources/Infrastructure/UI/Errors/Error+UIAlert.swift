//
//  Error+UIAlert.swift
//  App Unit Tests
//
//  Created by Hardijs Kirsis on 09/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsNetworking
import DevToolsUI
import SwedApplicationBusinessRules

extension Error {
    func makeAlertConfiguration(
        buttons: [AlertConfiguration.Button] = []
    ) -> AlertConfiguration {
        AlertConfiguration(
            title: alertTitle,
            message: alertMessage,
            buttons: buttons.isEmpty ? [defaultOkeyButton] : buttons
        )
    }
}

// MARK: Helpers
extension Error {
    private var alertTitle: String {
        if self is NetworkError {
            return AppStrings.Error.Network.Generic.title
        }
        if let sessionError = self as? UserSessionError {
            switch sessionError {
            case .invalidLoginCredentials:
                return AppStrings.Error.UserSession.InvalidLoginCredentials.title
            }
        }
        return AppStrings.Error.Generic.title
    }
    
    private var alertMessage: String {
        if self is NetworkError {
            return AppStrings.Error.Network.Generic.message
        }
        if let sessionError = self as? UserSessionError {
            switch sessionError {
            case .invalidLoginCredentials:
                return AppStrings.Error.UserSession.InvalidLoginCredentials.message
            }
        }
        return AppStrings.Error.Generic.message
    }
    
    private var defaultOkeyButton: AlertConfiguration.Button {
        AlertConfiguration.Button(
            title: AppStrings.Globals.ok,
            action: {}
        )
    }
}
