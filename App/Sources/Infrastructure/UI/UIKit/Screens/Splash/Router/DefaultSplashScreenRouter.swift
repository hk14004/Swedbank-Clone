//
//  DefaultSplashVMRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters

struct DefaultSplashScreenRouter: SplashScreenRouter {

    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToDashboard() {
        let factory: RootTabbarScreenFactory = Composition.resolve()
        let vc = factory.make()
        viewController.navigationController?.setViewControllers([vc], animated: false)
    }
    
    func routeToOnboarding() {
        print("routeToOnboarding")
    }
}
