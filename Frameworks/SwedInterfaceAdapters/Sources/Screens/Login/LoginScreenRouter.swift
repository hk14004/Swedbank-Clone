//
//  LoginScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

public protocol LoginScreenRouter: ToLanguageSelectionScreenRouting, ToErrorRouting {
    func routeToLoginCompleted(customer: CustomerDTO)
}
