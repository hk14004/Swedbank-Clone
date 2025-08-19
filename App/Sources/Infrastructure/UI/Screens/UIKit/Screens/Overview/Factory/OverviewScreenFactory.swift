//
//  OverviewScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

protocol OverviewScreenFactory {
    func make(customer: Customer) -> OverviewScreenVC
}

class DefaultDashboardScreenFactory: OverviewScreenFactory {
    func make(customer: Customer) -> OverviewScreenVC {
        let vm = DefaultOverviewScreenVM(
            customer: customer,
            getRemoteOffersUseCase: Composition.resolve(),
            trackCachedOffersUseCase: Composition.resolve(),
            getRemoteAccountsUseCase: Composition.resolve(),
            trackCachedAccountsUseCase: Composition.resolve()
        )
        let vc = OverviewScreenVC(viewModel: vm)
        let router = DefaultOverviewScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
