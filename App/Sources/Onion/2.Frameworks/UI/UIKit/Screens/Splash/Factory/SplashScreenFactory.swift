//
//  SplashScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsUI
import UIKit

protocol SplashScreenFactory: UIKitScreenFactory {}

class DefaultSplashScreenFactory: SplashScreenFactory {
    func make() -> UIViewController {
        let vm = DefaultSplashVM()
        let vc = SplashVC(viewModel: vm)
        let router = DefaultSplashRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
