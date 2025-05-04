//
//  AppAppearance.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI

class AppAppearance {}

// MARK: Public
extension AppAppearance {
    static func configureAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = Colors.white2.color
        appearance.stackedLayoutAppearance.selected.iconColor = Colors.accent1.color
        appearance.stackedLayoutAppearance.normal.iconColor = Colors.text2.color
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: Colors.accent1.color]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: Colors.text2.color]
        appearance.shadowColor = UIColor.clear
        AppearanceProxy.setDefault(tabbarAppearance: appearance)
        
        let navAppearance = UINavigationBarAppearance()
        AppearanceProxy.setDefault(controlTintColor: Colors.accent1.color)
        AppearanceProxy.setDefault(navigationBarControlColor: Colors.accent1.color)
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navAppearance.titleTextAttributes = [.foregroundColor: Colors.accent1.color]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: Colors.accent1.color]
        navAppearance.shadowColor = .clear
        UINavigationBar.appearance().prefersLargeTitles = true
        AppearanceProxy.setDefault(navigationBarAppearance: navAppearance)
    }
}
