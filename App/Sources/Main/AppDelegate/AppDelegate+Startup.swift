//
//  AppDelegate+Startup.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

extension AppDelegate {
    func startup() {
        registerApplicationLaunch()
        AppAppearance.configureAppearance()
        routeToSplashScreen()
    }
}
