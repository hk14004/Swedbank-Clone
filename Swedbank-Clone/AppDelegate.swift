//
//  AppDelegate.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import UIKit
import DevToolsCore
import DevToolsUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}

// MARK: Private

extension AppDelegate {
    private func configure() {
        configureAppearance()
        let userSessionManager = DI.container.resolve(BaseUserSessionManager<SwedbankUserSessionCredentials>.self)!
        userSessionManager.startAllUserSessions()
    }
    
    private func configureAppearance() {
        AppearanceProxy.setDefault(controlTintColor: Asset.Colors.color3.color)
        AppearanceProxy.setDefault(navigationBarControlColor: Asset.Colors.primaryText.color)
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navAppearance.titleTextAttributes = [.foregroundColor: Asset.Colors.color3.color]
        navAppearance.shadowColor = .clear
        AppearanceProxy.setDefault(navigationBarAppearance: navAppearance)
    }
}
