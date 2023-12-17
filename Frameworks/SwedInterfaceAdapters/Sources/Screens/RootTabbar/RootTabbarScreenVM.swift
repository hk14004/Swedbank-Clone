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

public protocol RootTabbarScreenVMOutput {
    var tabsPublisher: AnyPublisher<[PresentableRootTab], Never> { get }
    var router: RootTabbarScreenRouter! { get set }
}

public protocol RootTabbarScreenVMInput {
    func viewDidLoad()
    func didUnlockOverview(customer: CustomerDTO)
}

public protocol RootTabbarScreenVM: RootTabbarScreenVMInput, RootTabbarScreenVMOutput {}

public class DefaultRootTabbarScreenVM: RootTabbarScreenVM {
    public var tabsPublisher: AnyPublisher<[PresentableRootTab], Never> {
        $presentableTabs.eraseToAnyPublisher()
    }
    public var router: RootTabbarScreenRouter!
    @Published private var presentableTabs: [PresentableRootTab] = []
    private let isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase
    
    public init(isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase) {
        self.isAnyUserSessionActiveUseCase = isAnyUserSessionActiveUseCase
        presentableTabs = makePresentableTabs()
    }
    
}

// MARK: Input
public extension DefaultRootTabbarScreenVM {
    func viewDidLoad() {}
    func didUnlockOverview(customer: CustomerDTO) {
        presentableTabs = makePresentableTabs()
    }
}

// MARK: Private
extension DefaultRootTabbarScreenVM {
    private func makePresentableTabs() -> [PresentableRootTab] {
        [
            makeOverViewTab()
        ]
    }
    
    private func makeOverViewTab() -> PresentableRootTab {
        let locked = !isAnyUserSessionActiveUseCase.use()
        return .init(
            type: .overview,
            nameKey: "Tabbar.Tabs.Overview.title",
            unselectedImageName: locked ? "lock" : "house",
            selectedImageName: locked ? "lock" : "house",
            locked: locked
        )
    }
}
