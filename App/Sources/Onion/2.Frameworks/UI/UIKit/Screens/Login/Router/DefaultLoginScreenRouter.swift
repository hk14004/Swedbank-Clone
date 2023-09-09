//
//  DefaultLoginRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

class DefaultLoginScreenRouter: LoginScreenRouter {

    var viewController: UIViewController

    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func routeToDashboard() {
        print("Route to dashboard plz")
    }
}
