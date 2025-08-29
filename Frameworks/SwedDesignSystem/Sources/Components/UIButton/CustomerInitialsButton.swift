//
//  ProfileIconButton.swift
//  SWEDBANK LV
//
//  Created by Hardijs Ķirsis on 08/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

public class CustomerInitialsButton: UIButton {
    // MARK: Properties
    private var profileIconView = CustomerInitialsView()

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
        clipsToBounds = true
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
        addSubview(profileIconView)
        profileIconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        profileIconView.isUserInteractionEnabled = false
    }
    
    public func configure(text: String) {
        setTitle(text, for: .normal)
        profileIconView.configure(text: text)
    }
}
