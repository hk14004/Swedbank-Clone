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
        AppAppearance.configureAppearance()
        configureWindow()
    }
    
    private func configureWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let screenFactory: SplashScreenFactory = Composition.resolve()
        let vc: SplashScreenVC = screenFactory.make()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
}
