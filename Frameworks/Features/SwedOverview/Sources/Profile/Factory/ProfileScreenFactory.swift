//
//  ProfileScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import DevToolsNavigation
import UIKit
import Combine

public protocol ProfileScreenFactory: UIKitScreenFactory where Params == ProfileScreenFactoryParams {}

public struct ProfileScreenFactoryParams {
    let customer: Customer
    let logoutFinished: PassthroughSubject<Void, Never>
    
    public init(
        customer: Customer,
        logoutFinished: PassthroughSubject<Void, Never>
    ) {
        self.customer = customer
        self.logoutFinished = logoutFinished
    }
}

public class DefaultProfileScreenFactory: ProfileScreenFactory {
    let di: Dependencies
    
    public init(di: Dependencies) {
        self.di = di
    }
    
    public func make(params: ProfileScreenFactoryParams) -> UIViewController {
        let vm = DefaultProfileScreenVM(logoutUseCase: di.logoutUseCase)
        let vc = ProfileScreenVC(viewModel: vm)
        let router = DefaultProfileScreenRouter(
            viewController: vc,
            logoutFinished: params.logoutFinished
        )
        vm.router = router
        return vc
    }
}
