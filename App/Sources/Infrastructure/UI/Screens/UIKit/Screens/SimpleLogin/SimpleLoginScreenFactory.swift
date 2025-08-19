//
//  DefaultSimpleLoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

protocol SimpleLoginScreenFactory {
    func make() -> SimpleLoginScreenVC
}

class DefaultSimpleLoginScreenFactory: SimpleLoginScreenFactory {
    func make() -> SimpleLoginScreenVC {
        let vm = DefaultSimpleLoginScreenVM(
            simpleLoginUseCase: Composition.resolve()
        )
        let vc = SimpleLoginScreenVC(viewModel: vm)
        let router = DefaultSimpleLoginScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
