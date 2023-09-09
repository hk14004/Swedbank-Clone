//
//  DashboardScreenVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

protocol DashboardScreenVMOutput {
    var tabs: CurrentValueSubject<[DashboardTab], Never> { get }
    var router: DashboardScreenRouter! { get set }
}

protocol DashboardScreenVMInput {
    func viewDidLoad()
}

protocol DashboardScreenVM: DashboardScreenVMInput, DashboardScreenVMOutput {}

class DefaultDashboardScreenVM: DashboardScreenVM {

    var tabs: CurrentValueSubject<[DashboardTab], Never>
    var router: DashboardScreenRouter!
    
    init() {
        self.tabs = .init([.overview])
    }
    
}

// MARK: Input

extension DefaultDashboardScreenVM {
    func viewDidLoad() {
        
    }
}

