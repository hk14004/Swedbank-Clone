//
//  LoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import UIKit
import SwedInterfaceAdapters
import SwedApplicationBusinessRules

protocol LoginScreenFactory {
    func make(didLoginPublisher: PassthroughSubject<CustomerDTO, Never>) -> LoginScreenVC
}

class DefaultLoginScreenFactory: LoginScreenFactory {
    func make(didLoginPublisher: PassthroughSubject<CustomerDTO, Never>) -> LoginScreenVC {
        let vm = DefaultLoginScreenVM(loginUseCase: Composition.resolve())
        let vc = LoginScreenVC(viewModel: vm)
        let router = DefaultLoginScreenRouter(
            viewController: vc,
            didLoginPublisher: didLoginPublisher
        )
        vm.router = router
        return vc
    }
}
