//
//  DefaultDashboardScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters

class DefaultRootTabbarScreenRouter: RootTabbarScreenRouter {
    
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeTo(tab: DashboardTab) {
        print("")
    }
    
}
