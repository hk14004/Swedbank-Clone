//
//  LockedDashboardVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol LockedDashboardVMInput {
    func onLoginTapped()
    func onLanguageChangeTap()
}

protocol LockedDashboardVMOutput {
    var presentation: LockedDashboardPresentationConfig { get }
    var router: LockedDashboardRouter! { get set }
}

protocol LockedDashboardVM: LockedDashboardVMInput, LockedDashboardVMOutput {}

class DefaultLockedDashboardVM: LockedDashboardVM {
    var presentation: LockedDashboardPresentationConfig
    var router: LockedDashboardRouter!
    
    init(presentation: LockedDashboardPresentationConfig) {
        self.presentation = presentation
    }
}

extension DefaultLockedDashboardVM {
    func onLoginTapped() {
        router.routeToLogin()
    }
    
    func onLanguageChangeTap() {
        router.routeToLanguageChange()
    }
}
