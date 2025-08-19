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
    var customer: Customer { get }
}

public protocol RootTabbarScreenVMInput {
    func viewDidLoad()
    func didUnlock()
    func didLock()
}

public protocol RootTabbarScreenVM: RootTabbarScreenVMInput, RootTabbarScreenVMOutput {}

public class DefaultRootTabbarScreenVM: RootTabbarScreenVM {
    // MARK: Variables
    public var customer: Customer
    public var router: RootTabbarScreenRouter!
    public var tabsPublisher: CurrentValueSubject<[RootTab], Never>
    public var lockedPublisher: CurrentValueSubject<Bool, Never>
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: LifeCycle
    public init(customer: Customer, locked: Bool) {
        self.customer = customer
        self.tabsPublisher = .init([])
        self.lockedPublisher = .init(locked)
        self.tabsPublisher.value = makePresentableTabs()
    }
}

// MARK: Input
public extension DefaultRootTabbarScreenVM {
    func viewDidLoad() {}
    
    func didUnlock() {
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
            .contacts
        ]
    }
}
