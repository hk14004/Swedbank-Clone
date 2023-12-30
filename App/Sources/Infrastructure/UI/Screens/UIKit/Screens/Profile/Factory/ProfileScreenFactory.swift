//
//  ProfileScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters
import SwedApplicationBusinessRules

protocol ProfileScreenFactory {
    func make(customer: CustomerDTO) -> ProfileScreenVC
}

class DefaultProfileScreenFactory: ProfileScreenFactory {
    func make(customer: CustomerDTO) -> ProfileScreenVC {
        let vm = DefaultProfileScreenVM(logoutUseCase: Composition.resolve())
        let vc = ProfileScreenVC(viewModel: vm)
        let router = DefaultProfileScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
