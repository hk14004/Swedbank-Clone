//
//  LockedDashboardRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import DevToolsNavigation

class DefaultLockedDashboardRouter: LockedDashboardRouter, UIKitRouter {
    
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToLanguageChange() {
        print("routeToLanguageChange")
    }
    
    func routeToLogin() {
        let vc: LoginScreenVC = Composition.resolve()
        viewController.present(vc, animated: true)
    }
}
