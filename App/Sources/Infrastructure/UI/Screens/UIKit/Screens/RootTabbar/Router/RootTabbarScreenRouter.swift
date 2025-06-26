//
//  DefaultDashboardScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import DevToolsNavigation
import SwedApplicationBusinessRules

class DefaultRootTabbarScreenRouter: RootTabbarScreenRouter {
    
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeTo(tab: RootTab) {
        print("")
    }
    
}

extension ToRootTabbarScreenRouting where Self: UIKitRouter {
    func initRouteToRoot(customer: Customer?) {
        let factory: RootTabbarScreenFactory = Composition.resolve()
        let vc = factory.make(customer: customer)
        UIApplication.shared.delegate?.window??.rootViewController = vc
    }
}
