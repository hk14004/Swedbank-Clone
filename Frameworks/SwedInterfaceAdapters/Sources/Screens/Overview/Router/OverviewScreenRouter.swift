//
//  OverviewScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

public protocol OverviewScreenRouter: ToProfileScreenRouting, ToOfferDetailsRouting {}

public protocol ToOverviewScreenRouting {
    func routeToOverviewScreen(customer: CustomerDTO)
}
