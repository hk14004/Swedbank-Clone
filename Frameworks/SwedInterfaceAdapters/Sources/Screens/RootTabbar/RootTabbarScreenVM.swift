//
//  DashboardScreenVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import UIKit
import SwedApplicationBusinessRules

public protocol DashboardScreenVMOutput {
    var tabsPublisher: AnyPublisher<[PresentableDashboardTab], Never> { get }
    var router: RootTabbarScreenRouter! { get set }
}

public protocol DashboardScreenVMInput {
    func viewDidLoad()
}

public protocol RootTabbarScreenVM: DashboardScreenVMInput, DashboardScreenVMOutput {}

public class DefaultDashboardScreenVM: RootTabbarScreenVM {

    public var tabsPublisher: AnyPublisher<[PresentableDashboardTab], Never> {
        $presentableTabs.eraseToAnyPublisher()
    }
    public var router: RootTabbarScreenRouter!
    @Published private var presentableTabs: [PresentableDashboardTab] = []
    private var isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase
    
    public init(isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase) {
        self.isAnyUserSessionActiveUseCase = isAnyUserSessionActiveUseCase
    }
    
}

// MARK: Input

extension DefaultDashboardScreenVM {
    public func viewDidLoad() {
        presentableTabs = makePresentableTabs()
    }
}

// MARK: Private

extension DefaultDashboardScreenVM {
    private func makePresentableTabs() -> [PresentableDashboardTab] {
        [
            .init(
                type: .overview,
                nameKey: "Tabbar.Tabs.Overview.title",
                unselectedImageName: "house",
                selectedImageName: "house",
                locked: isOveriewTabLocked()
            )
        ]
    }
    
    private func isOveriewTabLocked() -> Bool {
        !isAnyUserSessionActiveUseCase.use()
    }
}
