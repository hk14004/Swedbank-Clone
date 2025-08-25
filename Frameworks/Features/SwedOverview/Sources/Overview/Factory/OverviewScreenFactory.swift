//
//  OverviewScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication

public protocol OverviewScreenFactory {
    func make(
        customer: Customer,
        onLaunchProfileIntent: @escaping () -> Void
    ) -> OverviewScreenVC
}

public class DefaultDashboardScreenFactory: OverviewScreenFactory {
    private let di: Dependencies
    
    public init(di: Dependencies) {
        self.di = di
    }
    
    public func make(
        customer: Customer,
        onLaunchProfileIntent: @escaping () -> Void
    ) -> OverviewScreenVC {
        let vm = DefaultOverviewScreenVM(
            customer: customer,
            getRemoteOffersUseCase: di.getRemoteOffersUseCase,
            trackCachedOffersUseCase: di.trackCachedOffersUseCase,
            getRemoteAccountsUseCase: di.getRemoteAccountsUseCase,
            trackCachedAccountsUseCase: di.trackCachedAccountsUseCase
        )
        let vc = OverviewScreenVC(viewModel: vm)
        let router = DefaultOverviewScreenRouter(
            viewController: vc,
            onLaunchProfileIntent: onLaunchProfileIntent
        )
        vm.router = router
        return vc
    }
}
