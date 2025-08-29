//
//  PrimaryButton.swift
//  SWEDBANK LV
//
//  Created by Hardijs Ķirsis on 08/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsLocalization

public class PrimaryButton: RuntimeLocalizedButton {
    // MARK: LifeCycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setup() {
        backgroundColor = AppColors.accent1.color
        layer.cornerRadius = UIConstant.Button.cornerRadius
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.font = AppTypography.body.scaledFont
    }
}
