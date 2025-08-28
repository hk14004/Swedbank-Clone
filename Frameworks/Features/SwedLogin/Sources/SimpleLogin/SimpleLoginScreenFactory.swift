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

public protocol SimpleLoginScreenFactory: UIKitScreenFactory {}

public struct SimpleLoginScreenFactoryParams {
    var onLoginCompletedEvent: PassthroughSubject<Void, Never>
    
    public init(onLoginCompletedEvent: PassthroughSubject<Void, Never>) {
        self.onLoginCompletedEvent = onLoginCompletedEvent
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
            onLoginCompletedEvent: params.onLoginCompletedEvent
        )
        vm.router = router
        return vc
    }
}
