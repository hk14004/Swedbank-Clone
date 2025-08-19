//
//  RootTabbarScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Application

protocol RootTabbarScreenFactory {
    func make(customer: Customer, locked: Bool) -> RootTabbarScreenVC
}

class DefaultRootTabbarScreenFactory: RootTabbarScreenFactory {
    func make(customer: Customer, locked: Bool) -> RootTabbarScreenVC {
        let vm = DefaultRootTabbarScreenVM(customer: customer, locked: true)
        let vc = RootTabbarScreenVC(viewModel: vm)
        let router = DefaultRootTabbarScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
