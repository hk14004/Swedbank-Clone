//
//  OverviewScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters
import SwedApplicationBusinessRules

protocol OverviewScreenFactory {
    func make(customer: CustomerDTO) -> OverviewScreenVC
}

class DefaultDashboardScreenFactory: OverviewScreenFactory {
    func make(customer: CustomerDTO) -> OverviewScreenVC {
        let vm = DefaultOverviewScreenVM(customer: customer)
        let vc = OverviewScreenVC(viewModel: vm)
        let router = DefaultOverviewScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
