//
//  ProfileScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication

public protocol ProfileScreenRouter {
    func routeToSplashScreen()
}

public protocol ToProfileScreenRouting {
    func routeToProfileScreen(customer: Customer)
    func routeToSplashScreen()
}
