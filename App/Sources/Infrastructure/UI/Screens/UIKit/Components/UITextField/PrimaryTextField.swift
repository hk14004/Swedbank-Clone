//
//  PrimaryTextField.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

class PrimaryTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [NSAttributedString.Key.foregroundColor: AppColors.text1.color]
            )
        }
    }
    
    private func setup() {
        font = AppTypography.input.scaledFont
        adjustsFontForContentSizeCategory = true
        textColor = AppColors.text1.color
    }
}
