//
//  DefaultDashboardRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import UIKit
import SwedInterfaceAdapters
import SwedApplicationBusinessRules
import DevToolsNavigation

class DefaultOverviewScreenRouter: OverviewScreenRouter, UIKitRouter {
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension ToOverviewScreenRouting where Self: UIKitRouter {
    func routeToOverviewScreen(customer: Customer) {
        let factory: OverviewScreenFactory = Composition.resolve()
        let vc = factory.make(customer: customer)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

