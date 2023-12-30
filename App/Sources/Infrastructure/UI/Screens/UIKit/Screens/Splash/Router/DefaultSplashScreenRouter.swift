//
//  DefaultSplashVMRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import DevToolsNavigation

class DefaultSplashScreenRouter: SplashScreenRouter, UIKitRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToOnboarding() {
        print("routeToOnboarding")
    }
}
