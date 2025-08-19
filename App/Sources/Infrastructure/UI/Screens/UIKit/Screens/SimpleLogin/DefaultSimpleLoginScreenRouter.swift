//
//  SimpleLoginScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsNavigation

class DefaultSimpleLoginScreenRouter: SimpleLoginScreenRouter, UIKitRouter, ToRootTabbarScreenRouting {
    
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToDashboard() {
        initRouteToRoot(customer: JAMES_BOND)
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
