//
//  SceneDelegate.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import UIKit
import DevToolsUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo
               session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        configureAppearance()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let coordinator = DI.container.resolve(AppCoordinator.self)!
        coordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
    }

    private func configureAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = Asset.Colors.color7.color
        appearance.stackedLayoutAppearance.selected.iconColor = Asset.Colors.color3.color
        appearance.stackedLayoutAppearance.normal.iconColor = Asset.Colors.primaryText.color
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: Asset.Colors.color3.color]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: Asset.Colors.primaryText.color]
        appearance.shadowColor = UIColor.clear
        AppearanceProxy.setDefault(tabbarAppearance: appearance)
        
        let navAppearance = UINavigationBarAppearance()
        AppearanceProxy.setDefault(controlTintColor: Asset.Colors.color3.color)
        AppearanceProxy.setDefault(navigationBarControlColor: Asset.Colors.primaryText.color)
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navAppearance.titleTextAttributes = [.foregroundColor: Asset.Colors.color3.color]
        navAppearance.shadowColor = .clear
        AppearanceProxy.setDefault(navigationBarAppearance: navAppearance)
    }
}
