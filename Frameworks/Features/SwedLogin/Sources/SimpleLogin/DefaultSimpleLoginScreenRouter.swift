//
//  SimpleLoginScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsNavigation
import SwedApplication
import Combine

class DefaultSimpleLoginScreenRouter: SimpleLoginScreenRouter, UIKitRouter {

    weak var viewController: UIViewController?
    private var loginCompleted: PassthroughSubject<Void, Never>

    init(
        viewController: UIViewController,
        loginCompleted: PassthroughSubject<Void, Never>
    ) {
        self.viewController = viewController
        self.loginCompleted = loginCompleted
    }
    
    func routeToLoginCompleted() {
        loginCompleted.send(())
        loginCompleted.send(completion: .finished)
    }
}
