//
//  DefaultSplashVMRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

struct DefaultSplashScreenRouter: SplashScreenRouter {

    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToHome() {
        print("Routing to home bro")
    }
    
    func routeToOnboarding() {
        print("Onboarding?")
    }
    
    func routeToLogin() {
        let vc: LoginScreenVC = Composition.resolve()
        viewController.navigationController?.setViewControllers([vc], animated: false)
    }
}
