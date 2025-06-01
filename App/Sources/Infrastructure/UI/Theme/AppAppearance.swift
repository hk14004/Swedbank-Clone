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
        appearance.backgroundColor = AppColors.tabbar1.color
        appearance.stackedLayoutAppearance.selected.iconColor = AppColors.text2.color
        appearance.stackedLayoutAppearance.normal.iconColor = AppColors.text2.color
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: AppColors.text2.color, .font: AppTypography.title5.scaledFont]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: AppColors.text2.color, .font: AppTypography.title4.scaledFont]
        appearance.shadowColor = UIColor.clear
        AppearanceProxy.setDefault(tabbarAppearance: appearance)
        
        let navAppearance = UINavigationBarAppearance()
        AppearanceProxy.setDefault(controlTintColor: AppColors.accent1.color)
        AppearanceProxy.setDefault(navigationBarControlColor: AppColors.accent1.color)
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navAppearance.titleTextAttributes = [.foregroundColor: AppColors.accent1.color]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: AppColors.accent1.color]
        navAppearance.shadowColor = .clear
        UINavigationBar.appearance().prefersLargeTitles = true
        AppearanceProxy.setDefault(navigationBarAppearance: navAppearance)
    }
}
