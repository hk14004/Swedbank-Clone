//
//  ProfileScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwedInterfaceAdapters
import SwedApplicationBusinessRules
import DevToolsNavigation
import UIKit

class DefaultProfileScreenRouter: ProfileScreenRouter, UIKitRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension ToProfileScreenRouting where Self: UIKitRouter {
    func routeToProfileScreen(customer: Customer) {
        let factory: ProfileScreenFactory = Composition.resolve()
        let vc = factory.make(customer: customer)
        let navVC = UINavigationController(rootViewController: vc)
        viewController?.present(navVC, animated: true)
    }
}
