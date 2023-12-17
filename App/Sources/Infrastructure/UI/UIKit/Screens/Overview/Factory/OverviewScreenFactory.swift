//
//  OverviewScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedInterfaceAdapters

protocol OverviewScreenFactory {
    func make() -> OverviewScreenVC
}

class DefaultDashboardScreenFactory: OverviewScreenFactory {
    func make() -> OverviewScreenVC {
        let vm = DefaultOverviewScreenVM()
        let vc = OverviewScreenVC()
        return vc
    }
}
