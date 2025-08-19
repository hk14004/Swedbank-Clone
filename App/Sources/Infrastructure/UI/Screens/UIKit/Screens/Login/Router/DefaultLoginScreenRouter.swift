//
//  DefaultLoginScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import SwedApplicationBusinessRules
import DevToolsNavigation
import Localization

class DefaultLoginScreenRouter: UIKitRouter, LoginScreenRouter, CancelBagStorable {
    var cancelBag = Set<AnyCancellable>()
    weak var viewController: UIViewController?
    let didLoginPublisher: PassthroughSubject<Void, Never>
    
    init(
        viewController: UIViewController,
        didLoginPublisher: PassthroughSubject<Void, Never>
    ) {
        self.viewController = viewController
        self.didLoginPublisher = didLoginPublisher
    }
    
    func routeToLoginCompleted(customer: Customer) {
        didLoginPublisher.send()
    }
}

import DevToolsCore
extension ToErrorRouting where Self: UIKitRouter  {
    func routeToOkeyErrorAlert(_ error: Error, onDismiss: (() -> Void)? = nil) {
        let alertViewController = UIAlertController(
            configuration: error.makeAlertConfiguration(
                buttons: [
                    AlertConfiguration.Button(
                        title: AppStrings.Globals.ok,
                        action: onDismiss ?? {}
                    )
                ]
            )
        )
        viewController?.present(alertViewController, animated: true)
    }
}
