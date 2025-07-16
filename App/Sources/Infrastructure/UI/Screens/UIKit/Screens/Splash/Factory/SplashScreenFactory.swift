//
//  SplashScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import DevToolsUI

protocol SplashScreenFactory {
    func make() -> SplashScreenVC
}

class DefaultSplashScreenFactory: SplashScreenFactory {
    func make() -> SplashScreenVC {
        let vm = DefaultSplashVM(
            fakeAlreadyLoggedInUseCase: Composition.resolve(),
            getLastCustomerUseCase: Composition.resolve(),
            startUserSessionUseCase: Composition.resolve()
        )
        let vc = SplashScreenVC(viewModel: vm)
        let router = DefaultSplashScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
