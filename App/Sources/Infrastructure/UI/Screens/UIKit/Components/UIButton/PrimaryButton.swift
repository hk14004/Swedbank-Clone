//
//  PrimaryButton.swift
//  SWEDBANK LV
//
//  Created by Hardijs Ķirsis on 08/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = SWEDBANKAsset.Colors.orange1.color
        layer.cornerRadius = 16
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.font = AppTypography.body.scaledFont
    }
}
