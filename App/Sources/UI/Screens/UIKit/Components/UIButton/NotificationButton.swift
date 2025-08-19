//
//  NotificationButton.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit

class NotificationButton: UIButton {
    // MARK: Constants
    enum Constant {
        static let bellIconName = "bell.fill"
    }
    
    // MARK: Properties
    private var iconView = UIImageView(
        image: UIImage(
            systemName: Constant.bellIconName)?
            .withTintColor(AppColors.text2.color)
            .withRenderingMode(.alwaysOriginal)
    )
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration = .plain()
        configuration?.baseForegroundColor = .clear
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setup() {
        clipsToBounds = false
        snp.makeConstraints { make in
            make.size.equalTo(UIConstant.NavigationBar.barButtonSize)
        }
        configurationUpdateHandler = { button in
            if button.isHighlighted {
                button.alpha = UIConstant.Button.highlightAlpha
            } else {
                button.alpha = UIConstant.Button.defaultAlpha
            }
        }
        setupProfileIconView()
    }
    
    private func setupProfileIconView() {
        addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(UIConstant.NavigationBar.barButtonIconSize)
        }
        iconView.isUserInteractionEnabled = false
    }
    
    func configure(notificationCount: Int) {}
}
