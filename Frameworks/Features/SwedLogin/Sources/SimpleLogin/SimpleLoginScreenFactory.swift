//
//  DefaultSimpleLoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import DevToolsNavigation
import UIKit
import Combine

public protocol SimpleLoginScreenFactory: UIKitScreenFactory where Params == SimpleLoginScreenFactoryParams {}

public struct SimpleLoginScreenFactoryParams {
    var loginCompleted: PassthroughSubject<Void, Never>
    
    public init(loginCompleted: PassthroughSubject<Void, Never>) {
        self.loginCompleted = loginCompleted
    }
}

public class DefaultSimpleLoginScreenFactory: SimpleLoginScreenFactory {
    let di: Dependencies
    
    public init(di: Dependencies) {
        self.di = di
    }
    
    public func make(params: SimpleLoginScreenFactoryParams) -> UIViewController {
        let vm = DefaultSimpleLoginScreenVM(
            simpleLoginUseCase: di.simpleLoginUseCase
        )
        let vc = SimpleLoginScreenVC(viewModel: vm)
        let router = DefaultSimpleLoginScreenRouter(
            viewController: vc,
            loginCompleted: params.loginCompleted
        )
        vm.router = router
        return vc
    }
}
