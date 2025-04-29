//
//  ProfileIconButton.swift
//  SWEDBANK LV
//
//  Created by Hardijs Ķirsis on 08/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsLocalization

class CustomerInitialsButton: UIButton {
    // MARK: Constants
    enum Constant {
        static let highlightAlpha: CGFloat = 0.5
        static let defaultAlpha: CGFloat = 1
    }
    
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
        configurationUpdateHandler = { button in
            if button.isHighlighted {
                button.alpha = Constant.highlightAlpha
            } else {
                button.alpha = Constant.defaultAlpha
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
    
    func configure(text: String) {
        setTitle(text, for: .normal)
        profileIconView.configure(text: text)
    }
}
