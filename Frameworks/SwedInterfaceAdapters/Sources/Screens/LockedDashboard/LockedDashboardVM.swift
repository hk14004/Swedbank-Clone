//
//  LockedDashboardVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol LockedDashboardVMInput {
    func onLoginTapped()
    func onLanguageChangeTap()
}

public protocol LockedDashboardVMOutput {
    var presentation: LockedDashboardPresentationConfig { get }
    var router: LockedDashboardRouter! { get set }
}

public protocol LockedDashboardVM: ObservableObject, LockedDashboardVMInput, LockedDashboardVMOutput {}

public class DefaultLockedDashboardVM: LockedDashboardVM {
    public var presentation: LockedDashboardPresentationConfig
    public var router: LockedDashboardRouter!
    
    public init(presentation: LockedDashboardPresentationConfig) {
        self.presentation = presentation
    }
}

public extension DefaultLockedDashboardVM {
    func onLoginTapped() {
        router.routeToLogin()
    }
    
    func onLanguageChangeTap() {
        router.routeToLanguageChange()
    }
}
