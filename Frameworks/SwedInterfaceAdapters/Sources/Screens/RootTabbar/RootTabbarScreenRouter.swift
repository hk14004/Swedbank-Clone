//
//  DashboardScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol RootTabbarScreenRouter {
    func routeTo(tab: DashboardTab)
}
