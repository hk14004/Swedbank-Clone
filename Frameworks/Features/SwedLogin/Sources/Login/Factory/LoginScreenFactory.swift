//
//  LoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import UIKit
import SwedApplication
import DevToolsNavigation
import Combine

protocol LoginScreenFactory: UIKitScreenFactory where Params == LoginScreenFactoryParams {}

public struct LoginScreenFactoryParams {
    let customer: Customer
    let didLoginPublisher: PassthroughSubject<Void, Never>
}

class DefaultLoginScreenFactory: LoginScreenFactory {
    
    let di: Dependencies
    
    public init(di: Dependencies) {
        self.di = di
    }
    
    func make(params: LoginScreenFactoryParams) -> UIViewController {
        let vm = DefaultLoginScreenVM(
            customer: params.customer,
            pinAuthenticateUseCase: di.pinAuthenticateUseCase,
            getLastCustomerUseCase: di.getLastCustomerUseCase,
            biometryAuthenticateUseCase: di.biometryAuthenticateUseCase
        )
        let vc = LoginScreenVC(viewModel: vm)
        let router = DefaultLoginScreenRouter(
            viewController: vc,
            didLoginPublisher: params.didLoginPublisher
        )
        vm.router = router
        return vc
    }
}
