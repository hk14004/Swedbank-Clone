//
//  OverviewScreenView+BalanceCellView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters

extension OverviewScreenView {
    final class BalanceCellView: UITableViewCell {
        enum Constants {
            static let contentPadding: CGFloat = 16
            static let currencyPadding: CGFloat = 4
        }
        private lazy var mainStack: UIStackView = {
           let view = UIStackView()
            view.axis = .horizontal
            return view
        }()
        private lazy var ibanLabel: UILabel = {
           let view = UILabel()
            view.textColor = SWEDBANKAsset.Colors.text3.color
            view.font = AppTypography.body.scaledFont
            return view
        }()
        private lazy var amountLabel: UILabel = {
           let view = UILabel()
            view.textColor = SWEDBANKAsset.Colors.text2.color
            view.font = AppTypography.title.scaledFont
            return view
        }()
        private lazy var currencyLabel: UILabel = {
           let view = UILabel()
            view.textColor = SWEDBANKAsset.Colors.text2.color
            view.font = AppTypography.title.scaledFont
            return view
        }()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}

// MARK: Public
extension OverviewScreenView.BalanceCellView {
    func configure(model: OverviewScreenBalanceCellViewModel) {
        ibanLabel.text = model.iban
        amountLabel.text = model.amount.formatted()
        currencyLabel.text = model.currencyCode.uppercased()
        configure(padding: Constants.contentPadding)
    }
    
    func configure(padding: CGFloat) {
        contentView.setMargins(direction: .both, constant: padding)
    }
}

// MARK: Private
extension OverviewScreenView.BalanceCellView {
    private func setup() {
        setupMainStack()
    }
    
    private func setupMainStack() {
        contentView.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView.layoutMarginsGuide)
        }
        setupMainStackContent()
    }
    
    private func setupMainStackContent() {
        mainStack.addArrangedSubview(ibanLabel)
        mainStack.addArrangedSubview(UIView())
        mainStack.addArrangedSubview(amountLabel)
        mainStack.addArrangedSubview(currencyLabel)
        mainStack.setCustomSpacing(Constants.currencyPadding, after: amountLabel)
    }
}
