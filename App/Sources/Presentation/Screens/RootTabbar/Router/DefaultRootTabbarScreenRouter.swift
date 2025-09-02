//
//  DefaultDashboardScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsNavigation
import SwedApplication
import Combine

class DefaultRootTabbarScreenRouter: RootTabbarScreenRouter {
    var cancelBag: Set<AnyCancellable> = []
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
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
