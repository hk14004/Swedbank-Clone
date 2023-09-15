//
//  DashboardScreenVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol DashboardScreenVMOutput {
    var tabs: CurrentValueSubject<[DashboardTab], Never> { get }
    var router: DashboardScreenRouter! { get set }
}

public protocol DashboardScreenVMInput {
    func viewDidLoad()
}

public protocol DashboardScreenVM: DashboardScreenVMInput, DashboardScreenVMOutput {}

public class DefaultDashboardScreenVM: DashboardScreenVM {

    public var tabs: CurrentValueSubject<[DashboardTab], Never>
    public var router: DashboardScreenRouter!
    
    public init() {
        self.tabs = .init([.overview])
    }
    
}

// MARK: Input

extension DefaultDashboardScreenVM {
    public func viewDidLoad() {
        
    }
}

