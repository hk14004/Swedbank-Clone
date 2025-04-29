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
    func configureDefault(customerCredentials: String = "") -> DefaultConfiguration {
        let configuration = DefaultConfiguration()
        configureActions(
            buttons: [
                configuration.notificationButton,
                configuration.profilebutton
            ]
        )
        configuration.profilebutton.configure(text: customerCredentials)
        return configuration
    }
    
    struct DefaultConfiguration {
        enum Constant {
            static let buttonWidth: CGFloat = 36
        }
        
        let notificationButton: UIButton = {
            let img = UIImage(systemName: "bell.fill")!
            let button = UIButton(configuration: .plain())
            button.setImage(img, for: .normal)
            button.tintColor = SWEDBANKAsset.Colors.text2.color
            button.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: Constant.buttonWidth).isActive = true
            return button
        }()
        let profilebutton: CustomerInitialsButton = {
            let view = CustomerInitialsButton()
            view.snp.makeConstraints { make in
                make.width.equalTo(Constant.buttonWidth)
            }
            return view
        }()
    }
}
