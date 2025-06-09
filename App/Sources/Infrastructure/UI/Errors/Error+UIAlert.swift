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
            title: alertInfo.title,
            message: alertInfo.message,
            buttons: buttons.isEmpty ? [defaultOkeyButton] : buttons
        )
    }
}

// MARK: Helpers
extension Error {
    private var alertInfo: ErrorAlertInfo {
        if self is NetworkError {
            return ErrorAlertInfo (
                title: AppStrings.Error.Network.Generic.title,
                message: AppStrings.Error.Network.Generic.message
            )
        }
        if let sessionError = self as? UserSessionError {
            switch sessionError {
            case .invalidLoginCredentials:
                return ErrorAlertInfo(
                    title: AppStrings.Error.UserSession.InvalidLoginCredentials.title,
                    message: AppStrings.Error.UserSession.InvalidLoginCredentials.message
                )
            }
        }
        return defaultAlertInfo
    }
    
    private var defaultAlertInfo: ErrorAlertInfo {
        ErrorAlertInfo(
            title: AppStrings.Error.Generic.title,
            message: AppStrings.Error.Generic.message
        )
    }
    
    private var defaultOkeyButton: AlertConfiguration.Button {
        AlertConfiguration.Button(
            title: AppStrings.Globals.ok,
            action: {}
        )
    }
}

fileprivate struct ErrorAlertInfo {
    let title: String
    let message: String
    
    init(title: String = "", message: String = "") {
        self.title = title
        self.message = message
    }
}
