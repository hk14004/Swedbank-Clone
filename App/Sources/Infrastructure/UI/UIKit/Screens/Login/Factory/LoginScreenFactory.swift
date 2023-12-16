//
//  LoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import Combine

protocol LoginScreenFactory {
    func make(didLoginPublisher: PassthroughSubject<Void, Never>) -> LoginScreenVC
}

class DefaultLoginScreenFactory: LoginScreenFactory {
    func make(didLoginPublisher: PassthroughSubject<Void, Never>) -> LoginScreenVC {
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
