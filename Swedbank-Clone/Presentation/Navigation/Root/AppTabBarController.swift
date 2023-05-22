//
//  AppTabBarController.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startup()
    }
}

extension AppTabBarController {
    private func startup() {
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = Asset.Colors.color1.color
        tabBar.tintColor = Asset.Colors.color2.color
    }
}
