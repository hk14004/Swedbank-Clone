//
//  DashboardScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import DevToolsNavigation

public protocol RootTabbarScreenRouter:
    UIKitRouter,
    CancelBagStorable,
    ToSplashScreenRouting,
    ToLanguageSelectionScreenRouting
{

}

public protocol ToRootTabbarScreenRouting {
    func initRouteToRoot(customer: Customer)
}
