//
//  LoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters

protocol LoginScreenFactory {
    func make() -> LoginScreenVC
}

class DefaultLoginScreenFactory: LoginScreenFactory {
    func make() -> LoginScreenVC {
        let vm = DefaultLoginScreenVM(loginUseCase: Composition.resolve())
        let vc = LoginScreenVC(viewModel: vm)
        let router = DefaultLoginScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
