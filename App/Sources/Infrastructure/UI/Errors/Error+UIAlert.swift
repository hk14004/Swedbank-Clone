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
        return AppStrings.Error.Generic.title
    }
    
    private var alertMessage: String {
        if self is NetworkError {
            return AppStrings.Error.Network.Generic.message
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
