//
//  DefaultDashboardRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import DevToolsNavigation
import SwedApplicationBusinessRules

class DefaultDashboardRouter: DashboardRouter, UIKitRouter {
    
    var viewController: UIViewController
    private let isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase

    init(
        viewController: UIViewController,
        isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase
    ) {
        self.viewController = viewController
        self.isAnyUserSessionActiveUseCase = isAnyUserSessionActiveUseCase
    }
    
    func goToRoot() {
        let locked = !isAnyUserSessionActiveUseCase.use()
        if locked {
            goToLocked()
        } else {
            goToDashboard(customer: .init(id: "", name: "", surname: ""))
        }
    }
    
    private func goToLocked() {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    private func goToDashboard(customer: CustomerDTO) {
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        navigationController?.setViewControllers([vc], animated: false)
    }
}
