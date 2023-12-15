//
//  DashboardScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters

protocol DashboardScreenFactory {
    func make() -> DashboardScreenVC
}

class DefaultDashboardScreenFactory: DashboardScreenFactory {
    func make() -> DashboardScreenVC {
        let vm = DefaultDashboardScreenVM()
        let vc = DashboardScreenVC()
        return vc
    }
}
