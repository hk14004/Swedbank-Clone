//
//  OverviewScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import UIKit
import DevToolsNavigation

public protocol OverviewScreenFactory: UIKitScreenFactory where Params == OverviewScreenFactoryParams {}

public struct OverviewScreenFactoryParams {
    public let customer: Customer
    public let onLaunchProfileIntent: () -> Void
    
    public init(customer: Customer, onLaunchProfileIntent: @escaping () -> Void) {
        self.customer = customer
        self.onLaunchProfileIntent = onLaunchProfileIntent
    }
}

public class DefaultDashboardScreenFactory: OverviewScreenFactory {
    private let di: Dependencies
    
    public init(di: Dependencies) {
        self.di = di
    }
    
    public func make(params: OverviewScreenFactoryParams) -> UIViewController {
        let vm = DefaultOverviewScreenVM(
            customer: params.customer,
            getRemoteOffersUseCase: di.getRemoteOffersUseCase,
            trackCachedOffersUseCase: di.trackCachedOffersUseCase,
            getRemoteAccountsUseCase: di.getRemoteAccountsUseCase,
            trackCachedAccountsUseCase: di.trackCachedAccountsUseCase
        )
        let vc = OverviewScreenVC(viewModel: vm)
        let router = DefaultOverviewScreenRouter(
            viewController: vc,
            offerDetailsScreenFactory: di.offerDetailsScreenFactory,
            onLaunchProfileIntent: params.onLaunchProfileIntent
        )
        vm.router = router
        return vc
    }
}
