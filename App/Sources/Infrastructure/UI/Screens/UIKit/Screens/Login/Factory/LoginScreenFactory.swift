//
//  LoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import UIKit
import SwedApplicationBusinessRules

protocol LoginScreenFactory {
    func make(
        customer: Customer,
        didLoginPublisher: PassthroughSubject<Void, Never>
    ) -> LoginScreenVC
}

class DefaultLoginScreenFactory: LoginScreenFactory {
    func make(
        customer: Customer,
        didLoginPublisher: PassthroughSubject<Void, Never>
    ) -> LoginScreenVC {
        let vm = DefaultLoginScreenVM(
            customer: customer,
            pinLoginUseCase: Composition.resolve(),
            getLastCustomerUseCase: Composition.resolve(),
            biometryAuthenticateUseCase: Composition.resolve()
        )
        let vc = LoginScreenVC(viewModel: vm)
        let router = DefaultLoginScreenRouter(
            viewController: vc,
            didLoginPublisher: didLoginPublisher
        )
        vm.router = router
        return vc
    }
}
