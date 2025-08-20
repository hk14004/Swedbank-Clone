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

class DefaultSimpleLoginScreenRouter: SimpleLoginScreenRouter, UIKitRouter, ToRootTabbarScreenRouting {
    
    weak var viewController: UIViewController?
    private let getCurrentCustomerUseCase: GetCurrentCustomerUseCase

    init(
        viewController: UIViewController,
        getCurrentCustomerUseCase: GetCurrentCustomerUseCase
    ) {
        self.viewController = viewController
        self.getCurrentCustomerUseCase = getCurrentCustomerUseCase
    }
    
    func routeToDashboard() {
        guard let cCustomer = getCurrentCustomerUseCase.use() else {
            fatalError("No customer found")
        }
        initRouteToRoot(customer: cCustomer)
    }

}

extension ToSimpleLoginScreenRouting where Self: UIKitRouter {
    func routeToSimpleLoginScreen() {
        let factory: SimpleLoginScreenFactory = Composition.resolve()
        let vc = factory.make()
        let window: UIWindow? = Composition.resolve()
        window?.rootViewController = vc
    }
}
