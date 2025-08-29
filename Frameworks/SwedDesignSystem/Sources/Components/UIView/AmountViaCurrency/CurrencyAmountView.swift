//
//  AmountViaCurrencyView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SnapKit

public class CurrencyAmountView: UIView {
    private var labels: [UILabel]  {
        [amountLabel, currencyLabel]
    }
    private lazy var mainStack: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        return view
    }()
    private lazy var amountLabel: UILabel = {
        let view = UILabel()
        view.textColor = AppColors.text2.color
        view.font = AppTypography.title.scaledFont
        return view
    }()
    private lazy var currencyLabel: UILabel = {
        let view = UILabel()
        view.textColor = AppColors.text2.color
        view.font = AppTypography.title.scaledFont
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Public
public extension CurrencyAmountView {
    func configure(amount: String, currency: String) {
        amountLabel.text = amount
        currencyLabel.text = currency.uppercased()
    }
    
    func configure(textColor: UIColor) {
        labels.forEach { $0.textColor = textColor }
    }
    
    func configure(font: UIFont) {
        labels.forEach { $0.font = font }
    }
}

// MARK: Private
extension CurrencyAmountView {
    private func setup() {
        setupMainStack()
        setupMainStackContent()
    }
    
    private func setupMainStack() {
        addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupMainStackContent() {
        mainStack.addArrangedSubview(amountLabel)
        mainStack.addArrangedSubview(currencyLabel)
    }
}
