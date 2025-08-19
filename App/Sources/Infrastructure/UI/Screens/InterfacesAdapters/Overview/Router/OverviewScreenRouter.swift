//
//  OverviewScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication

public protocol OverviewScreenRouter: ToProfileScreenRouting, ToOfferDetailsRouting, ToErrorRouting, ToSimpleLoginScreenRouting {}

public protocol ToOverviewScreenRouting {
    func routeToOverviewScreen(customer: Customer)
}
