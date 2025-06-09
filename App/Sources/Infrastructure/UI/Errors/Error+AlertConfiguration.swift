//
//  Error+AlertConfiguration.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 09/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import DevToolsCore

extension Error {
    func makeAlertConfiguration(
        buttons: [AlertConfiguration.Button] = []
    ) -> AlertConfiguration {
        return AlertConfiguration(
            title: alertContent.title,
            message: alertContent.message,
            buttons: buttons.isEmpty ? [defaultOkeyButton] : buttons
        )
    }
    
    private var alertContent: UIPresentableErrorContent {
        guard let presentableError = self as? UIPresentableError else {
            return genericErrorContent
        }
        return presentableError.presentableContent
    }
    
    private var genericErrorContent: UIPresentableErrorContent {
        UIPresentableErrorContent(
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
