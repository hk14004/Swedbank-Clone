//
//  DefaultDashboardScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsNavigation
import SwedApplicationBusinessRules

class DefaultRootTabbarScreenRouter: RootTabbarScreenRouter {
    
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeTo(tab: RootTab) {
        print("")
    }

}

extension ToRootTabbarScreenRouting where Self: UIKitRouter {
    func initRouteToRoot(customer: Customer) {
        let factory: RootTabbarScreenFactory = Composition.resolve()
        let vc = factory.make(customer: customer, locked: true)
        let window: UIWindow? = Composition.resolve()
        window?.rootViewController = vc
    }
}
