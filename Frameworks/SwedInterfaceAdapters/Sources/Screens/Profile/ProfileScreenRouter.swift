//
//  ProfileScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

public protocol ProfileScreenRouter: ToSplashScreenRouting {}

public protocol ToProfileScreenRouting {
    func routeToProfileScreen(customer: CustomerDTO)
}
