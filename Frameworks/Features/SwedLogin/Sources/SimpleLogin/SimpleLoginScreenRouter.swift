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
import UIKit

protocol SimpleLoginScreenRouter: ToErrorRouting {
    func routeToLoginCompleted()
}

public protocol ToSimpleLoginScreenRouting {
    var simpleLoginScreenFactory: any SimpleLoginScreenFactory { get }
    func routeToSimpleLoginScreen(params: SimpleLoginScreenFactoryParams)
}

public extension ToSimpleLoginScreenRouting where Self: UIKitRouter {
    func routeToSimpleLoginScreen(params: SimpleLoginScreenFactoryParams) {
        let vc = simpleLoginScreenFactory.make(params: params)
        navigationController?.pushViewController(vc, animated: true)
    }
}
