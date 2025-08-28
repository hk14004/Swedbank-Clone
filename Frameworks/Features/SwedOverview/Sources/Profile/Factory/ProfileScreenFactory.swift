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

public protocol ProfileScreenFactory: UIKitScreenFactory where Params == Customer {}


public class DefaultProfileScreenFactory: ProfileScreenFactory {
    let di: Dependencies
    
    public init(di: Dependencies) {
        self.di = di
    }
    
    public func make(params: Customer) -> UIViewController {
        let vm = DefaultProfileScreenVM(logoutUseCase: di.logoutUseCase)
        let vc = ProfileScreenVC(viewModel: vm)
        let router = DefaultProfileScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
