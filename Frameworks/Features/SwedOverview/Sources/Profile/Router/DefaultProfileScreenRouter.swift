//
//  ProfileScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwedApplication
import DevToolsNavigation
import UIKit

class DefaultProfileScreenRouter: ProfileScreenRouter, UIKitRouter {
    func routeToSplashScreen() {
        print("upsie")
    }
    
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

protocol HasProfileScreenFactory {
    var profileScreenFactory: ProfileScreenFactory { get }
}
extension ToProfileScreenRouting where Self: UIKitRouter & HasProfileScreenFactory {
    func routeToProfileScreen(customer: Customer) {
        let vc = profileScreenFactory.make(customer: customer)
        let navVC = UINavigationController(rootViewController: vc)
        viewController?.present(navVC, animated: true)
    }
}
