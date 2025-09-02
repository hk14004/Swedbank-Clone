//
//  SplashScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI

protocol SplashScreenFactory {
    func make() -> SplashScreenVC
}

class DefaultSplashScreenFactory: SplashScreenFactory {
    func make() -> SplashScreenVC {
        let vm = DefaultSplashVM(
            getLastCustomerUseCase: Composition.resolve(),
            getCurrentCustomerUseCase: Composition.resolve()
        )
        let vc = SplashScreenVC(viewModel: vm)
        let router = DefaultSplashScreenRouter(
            viewController: vc,
            simpleLoginScreenFactory: Composition.resolve()
        )
        vm.router = router
        return vc
    }
}
