//
//  AppDelegate.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import UIKit
//import DevToolsCore
//import DevToolsUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startup()
        return true
    }
    
    private func configureWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = SplashViewController(nibName: nil, bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
}

// MARK: Private

extension AppDelegate {
    private func startup() {
        configureWindow()
//        let userSessionManager = DI.container.resolve(BaseUserSessionManager<SwedbankUserSessionCredentials>.self)!
//        userSessionManager.startAllUserSessions()
    }
}
