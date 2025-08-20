//
//  OverviewScreenView+OfferCellView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedDesignSystem

extension OverviewScreenView {
    final class OfferCellView: UITableViewCell {
        enum Constants {
            static let contentPadding: CGFloat = 16
        }
        private lazy var mainStack: UIStackView = {
           let view = UIStackView()
            view.axis = .horizontal
            view.alignment = .center
            return view
        }()
        private lazy var offerTextLabel: UILabel = {
           let view = UILabel()
            view.numberOfLines = 0
            view.textColor = AppColors.text3.color
            view.font = AppTypography.body.scaledFont
            return view
        }()
        private lazy var disclosureImageView: UIImageView = {
            let image = UIImage(systemName: "chevron.right")
            let view = UIImageView(image: image)
            view.tintColor = AppColors.accent1.color
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
extension OverviewScreenView.OfferCellView {
    func configure(model: OverviewScreenOfferCellViewModel) {
        offerTextLabel.text = model.offerText
        configure(padding: Constants.contentPadding)
    }
    
    func configure(padding: CGFloat) {
        contentView.setMargins(direction: .both, constant: padding)
    }
}

// MARK: Private
extension OverviewScreenView.OfferCellView {
    private func setup() {
        selectionStyle = .none
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
        mainStack.addArrangedSubview(offerTextLabel)
        let spacer = UIView() // TODO: Copy spacer view
        mainStack.addArrangedSubview(spacer)
        mainStack.addArrangedSubview(disclosureImageView)
        mainStack.setCustomSpacing(Constants.contentPadding, after: spacer)
    }
}
