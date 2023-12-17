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
    var router: RootTabbarScreenRouter! { get set }
    var tabsPublisher: CurrentValueSubject<[RootTab], Never> { get }
    var lockedPublisher: CurrentValueSubject<Bool, Never> { get }
}

public protocol RootTabbarScreenVMInput {
    func viewDidLoad()
    func didUnlock(customer: CustomerDTO)
    func didLock()
}

public protocol RootTabbarScreenVM: RootTabbarScreenVMInput, RootTabbarScreenVMOutput {}

public class DefaultRootTabbarScreenVM: RootTabbarScreenVM {
    
    public var router: RootTabbarScreenRouter!
    public var tabsPublisher: CurrentValueSubject<[RootTab], Never>
    public var lockedPublisher: CurrentValueSubject<Bool, Never>
    private let isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase
    
    public init(isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase) {
        self.isAnyUserSessionActiveUseCase = isAnyUserSessionActiveUseCase
        self.tabsPublisher = .init([])
        self.lockedPublisher = .init(true)
    }
    
}

// MARK: Input
public extension DefaultRootTabbarScreenVM {
    func viewDidLoad() {
        lockedPublisher.value = !isAnyUserSessionActiveUseCase.use()
        tabsPublisher.value = makePresentableTabs()
    }
    
    func didUnlock(customer: CustomerDTO) {
        lockedPublisher.value = false
        tabsPublisher.value = makePresentableTabs()
    }
    
    func didLock() {
        lockedPublisher.value = true
        tabsPublisher.value = makePresentableTabs()
    }
}

// MARK: Private
extension DefaultRootTabbarScreenVM {
    private func makePresentableTabs() -> [RootTab] {
        [
            .overview,
            .payments,
            .cards,
            .services,
            .contacts
        ]
    }
}
