//
//  ToErrorRouting+UIKitRouter.swift
//  SwedUtils
//
//  Created by Hardijs on 29/08/2025.
//  Copyright © 2025 Swedbank. All rights reserved.
//

import Foundation
import DevToolsNavigation
import UIKit
import DevToolsCore
import SwedLocalization

public extension ToErrorRouting where Self: UIKitRouter  {
    func routeToOkeyErrorAlert(_ error: Error, onDismiss: (() -> Void)? = nil) {
        let alertViewController = UIAlertController(
            configuration: error.makeAlertConfiguration(
                buttons: [
                    AlertConfiguration.Button(
                        title: SwedLocalization.Globals.ok,
                        action: onDismiss ?? {}
                    )
                ]
            )
        )
        viewController?.present(alertViewController, animated: true)
    }
}
