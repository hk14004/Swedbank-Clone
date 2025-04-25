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
    var customer: CustomerDTO? { get }
}

public protocol RootTabbarScreenVMInput {
    func viewDidLoad()
    func didUnlock(customer: CustomerDTO)
    func didLock()
}

public protocol RootTabbarScreenVM: RootTabbarScreenVMInput, RootTabbarScreenVMOutput {}

public class DefaultRootTabbarScreenVM: RootTabbarScreenVM {
    // MARK: Variables
    public var customer: CustomerDTO?
    public var router: RootTabbarScreenRouter!
    public var tabsPublisher: CurrentValueSubject<[RootTab], Never>
    public var lockedPublisher: CurrentValueSubject<Bool, Never>
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: LifeCycle
    public init(customer: CustomerDTO?) {
        self.customer = customer
        self.tabsPublisher = .init([])
        self.lockedPublisher = .init(customer == nil)
        self.tabsPublisher.value = makePresentableTabs()
    }
}

// MARK: Input
public extension DefaultRootTabbarScreenVM {
    func viewDidLoad() {}
    
    func didUnlock(customer: CustomerDTO) {
        self.customer = customer
        lockedPublisher.value = false
        tabsPublisher.value = makePresentableTabs()
    }
    
    func didLock() {
        customer = nil
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
