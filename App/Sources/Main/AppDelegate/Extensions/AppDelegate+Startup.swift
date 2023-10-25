//
//  AppDelegate + Startup.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

extension AppDelegate {
    func startup() {
        registerApplicationLaunch()
        configureAppearance()
        configureWindow()
    }
    
    private func configureWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc: SplashScreenVC = Composition.resolve()
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
}
