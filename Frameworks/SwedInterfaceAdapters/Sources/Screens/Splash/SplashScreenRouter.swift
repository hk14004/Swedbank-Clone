//
//  SplashScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

public protocol SplashScreenRouter: ToRootTabbarScreenRouting, ToErrorRouting {
    func routeToOnboarding()
}

public protocol ToSplashScreenRouting {
    func routeToSplashScreen()
}
