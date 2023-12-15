//
//  LockedTabScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters

protocol LockedTabScreenFactory {
    func make(config: LockedDashboardPresentationConfig) -> LockedTabScreenVC
}

class DefaultLockedTabScreenFactory: LockedTabScreenFactory {
    func make(config: LockedDashboardPresentationConfig) -> LockedTabScreenVC {
        let vm = DefaultLockedDashboardVM(presentation: config)
        let vc = LockedTabScreenVC(viewModel: vm)
        let router = DefaultLockedDashboardRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
