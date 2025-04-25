//
//  RootTabbarScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters
import SwedApplicationBusinessRules

protocol RootTabbarScreenFactory {
    func make(customer: CustomerDTO?) -> RootTabbarScreenVC
}

class DefaultRootTabbarScreenFactory: RootTabbarScreenFactory {
    func make(customer: CustomerDTO?) -> RootTabbarScreenVC {
        let vm = DefaultRootTabbarScreenVM(customer: customer)
        let vc = RootTabbarScreenVC(viewModel: vm)
        let router = DefaultRootTabbarScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
