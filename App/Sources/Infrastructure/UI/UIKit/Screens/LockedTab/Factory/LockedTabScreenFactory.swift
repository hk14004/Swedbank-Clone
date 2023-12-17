//
//  LockedTabScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters
import SwedApplicationBusinessRules
import Combine

protocol LockedTabScreenFactory {
    func make(
        config: LockedDashboardPresentationConfig,
        didUnlockDashboardPublisher: PassthroughSubject<CustomerDTO, Never>
    ) -> LockedTabScreenVC
}

class DefaultLockedTabScreenFactory: LockedTabScreenFactory {
    func make(
        config: LockedDashboardPresentationConfig,
        didUnlockDashboardPublisher: PassthroughSubject<CustomerDTO, Never>
    ) -> LockedTabScreenVC {
        let vm = DefaultLockedDashboardVM(presentation: config)
        let vc = LockedTabScreenVC(viewModel: vm)
        let router = DefaultLockedDashboardRouter(
            viewController: vc,
            didUnlockDashboardPublisher: didUnlockDashboardPublisher
        )
        vm.router = router
        return vc
    }
}
