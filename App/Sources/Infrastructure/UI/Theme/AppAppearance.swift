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
        appearance.stackedLayoutAppearance.selected.iconColor = Colors.orange1.color
        appearance.stackedLayoutAppearance.normal.iconColor = Colors.text2.color
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: Colors.orange1.color]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: Colors.text2.color]
        appearance.shadowColor = UIColor.clear
        AppearanceProxy.setDefault(tabbarAppearance: appearance)
        
    //    let navAppearance = UINavigationBarAppearance()
    //    AppearanceProxy.setDefault(controlTintColor: Asset.Colors.color3.color)
    //    AppearanceProxy.setDefault(navigationBarControlColor: Asset.Colors.primaryText.color)
    //    navAppearance.configureWithOpaqueBackground()
    //    navAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
    //    navAppearance.titleTextAttributes = [.foregroundColor: Asset.Colors.color3.color]
    //    navAppearance.shadowColor = .clear
    //    AppearanceProxy.setDefault(navigationBarAppearance: navAppearance)
    //
    //    UITableViewHeaderFooterView.appearance().textLabel?.textColor = UIColor.red

    }
}
