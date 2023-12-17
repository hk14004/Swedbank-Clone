//
//  PrimaryNavigationBarView+DefaultConfiguration.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

// MARK: Default configuration
extension DashboardNavigationBarView {
    func configureDefault() -> DefaultConfiguration {
        let configuration = DefaultConfiguration()
        configureActions(
            buttons: [
                configuration.notificationButton,
                configuration.profilebutton
            ]
        )
        return configuration
    }
    
    struct DefaultConfiguration {
        let notificationButton: UIButton = {
            let img = UIImage(systemName: "bell.fill")!
            let button = UIButton(configuration: .plain())
            button.setImage(img, for: .normal)
            button.tintColor = SWEDBANKAsset.Colors.text1.color
            button.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 26).isActive = true
            return button
        }()
        let profilebutton: UIButton = {
            let img = UIImage(systemName: "person.fill")!
            let button = UIButton(configuration: .plain())
            button.setImage(img, for: .normal)
            button.tintColor = SWEDBANKAsset.Colors.text1.color
            button.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 26).isActive = true
            return button
        }()
    }
}
