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
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToOnboarding() {
        print("routeToOnboarding")
    }
}

extension ToSplashScreenRouting {
    func routeToSplashScreen() {
        let screenFactory: SplashScreenFactory = Composition.resolve()
        let vc: SplashScreenVC = screenFactory.make()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        let rootWindow: UIWindow = Composition.resolve()
        rootWindow.rootViewController = nav
        rootWindow.makeKeyAndVisible()
    }
}
