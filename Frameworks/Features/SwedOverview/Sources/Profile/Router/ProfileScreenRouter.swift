//
//  ProfileScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication

protocol ProfileScreenRouter {
    func routeToLogoutPressed()
}

protocol ToProfileScreenRouting {
    var profileScreenFactory: any ProfileScreenFactory { get }
    func routeToProfileScreen(params: Customer)
}
