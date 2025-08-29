//
//  Error+AlertConfiguration.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 09/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import DevToolsCore
import DevToolsNavigation
import UIKit
import SwedLocalization
import DevToolsUI

public extension Error {
    func makeAlertConfiguration(
        buttons: [AlertConfiguration.Button] = []
    ) -> AlertConfiguration {
        return AlertConfiguration(
            title: alertContent.title,
            message: alertContent.message,
            buttons: buttons.isEmpty ? [defaultOkeyButton] : buttons
        )
    }
    
    var fallbackErrorContent: UIPresentableErrorContent {
        UIPresentableErrorContent(
            title: SwedLocalization.Error.Generic.title,
            message: SwedLocalization.Error.Generic.message
        )
    }
    
    private var alertContent: UIPresentableErrorContent {
        guard let presentableError = self as? UIPresentableError else {
            return fallbackErrorContent
        }
        return presentableError.presentableContent
    }
    
    private var defaultOkeyButton: AlertConfiguration.Button {
        AlertConfiguration.Button(
            title: SwedLocalization.Globals.ok,
            action: {}
        )
    }
}
