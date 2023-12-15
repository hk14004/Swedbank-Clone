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
import DevToolsNavigation
import SwedApplicationBusinessRules

class DefaultDashboardRouter: DashboardRouter, UIKitRouter {
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
