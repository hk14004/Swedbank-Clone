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
    func didUnlock(customer: CustomerDTO)
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
    func didUnlock(customer: CustomerDTO) {
        presentableTabs = makePresentableTabs()
    }
}

// MARK: Private
extension DefaultRootTabbarScreenVM {
    private func makePresentableTabs() -> [PresentableRootTab] {
        [
            makeOverViewTab(),
            makePaymentsTab(),
            makeCardsTab(),
            makeServicesTab(),
            makeContactsTab()
        ]
    }
    
    private func makeOverViewTab() -> PresentableRootTab {
        let locked = !isAnyUserSessionActiveUseCase.use()
        return .init(
            type: .overview,
            locked: locked
        )
    }
    
    private func makePaymentsTab() -> PresentableRootTab {
        let locked = !isAnyUserSessionActiveUseCase.use()
        return .init(
            type: .payments,
            locked: locked
        )
    }
    
    private func makeCardsTab() -> PresentableRootTab {
        let locked = !isAnyUserSessionActiveUseCase.use()
        return .init(
            type: .cards,
            locked: locked
        )
    }
    private func makeServicesTab() -> PresentableRootTab {
        let locked = !isAnyUserSessionActiveUseCase.use()
        return .init(
            type: .services,
            locked: locked
        )
    }
    private func makeContactsTab() -> PresentableRootTab {
        let locked = !isAnyUserSessionActiveUseCase.use()
        return .init(
            type: .contacts,
            locked: locked
        )
    }
}
