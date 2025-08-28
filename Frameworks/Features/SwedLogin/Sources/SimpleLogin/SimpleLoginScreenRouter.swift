//
//  SimpleLoginScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import DevToolsNavigation

protocol SimpleLoginScreenRouter: ToErrorRouting {
    func onLoginCompleted()
}

public protocol ToSimpleLoginScreenRouting {
    func routeToSimpleLoginScreen(params: SimpleLoginScreenFactoryParams)
}
