//
//  RootTabbarScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import UIKit
import DevToolsNavigation

protocol RootTabbarScreenFactory: UIKitScreenFactory where Params == RootTabbarScreenFactoryParams {}

struct RootTabbarScreenFactoryParams {
    let customer: Customer
    let locked: Bool
}

class DefaultRootTabbarScreenFactory: RootTabbarScreenFactory {
    func make(params: RootTabbarScreenFactoryParams) -> UIViewController {
        let vm = DefaultRootTabbarScreenVM(customer: params.customer, locked: true)
        let vc = RootTabbarScreenVC(viewModel: vm)
        let router = DefaultRootTabbarScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
