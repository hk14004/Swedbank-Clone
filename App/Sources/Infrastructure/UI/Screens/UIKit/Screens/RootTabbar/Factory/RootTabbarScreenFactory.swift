//
//  RootTabbarScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters

protocol RootTabbarScreenFactory {
    func make() -> RootTabbarScreenVC
}

class DefaultRootTabbarScreenFactory: RootTabbarScreenFactory {
    func make() -> RootTabbarScreenVC {
        let vm = DefaultRootTabbarScreenVM(isAnyUserSessionActiveUseCase: Composition.resolve())
        let vc = RootTabbarScreenVC(viewModel: vm)
        let router = DefaultRootTabbarScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
