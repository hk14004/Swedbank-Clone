//
//  LockedDashboardRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

class DefaultLockedDashboardRouter: LockedDashboardRouter {
    
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToLanguageChange() {
        
    }
    
    func routeToLogin() {
        let vc: LoginScreenVC = Composition.resolve()
        viewController.present(vc, animated: true)
    }
}
