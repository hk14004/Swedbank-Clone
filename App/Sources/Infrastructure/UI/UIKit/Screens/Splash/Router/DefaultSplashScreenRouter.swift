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
    
    func routeToDashboard() {
        let factory: RootTabbarScreenFactory = Composition.resolve()
        let vc = factory.make()
        UIApplication.shared.delegate?.window??.rootViewController = vc
    }
    
    func routeToOnboarding() {
        print("routeToOnboarding")
    }
}
