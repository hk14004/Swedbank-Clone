//
//  ContactsScreenView+ContactCellView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters

extension ContactsScreenView {
    final class ContactCellView: UITableViewCell {
        enum Constants {
            static let iconSize: CGFloat = 24
            static let contentPadding: CGFloat = 16
            static let currencyPadding: CGFloat = 4
            static let textSpacing: CGFloat = 2
        }
        private lazy var mainStack: UIStackView = {
           let view = UIStackView()
            view.axis = .horizontal
            view.alignment = .center
            return view
        }()
        private lazy var textsStack: UIStackView = {
           let view = UIStackView()
            view.axis = .vertical
            view.spacing = Constants.textSpacing
            return view
        }()
        private lazy var iconView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.snp.makeConstraints { make in
                make.size.equalTo(Constants.iconSize)
            }
            return view
        }()
        private lazy var titleLabel: UILabel = {
           let view = UILabel()
            view.textColor = SWEDBANKAsset.Colors.text1.color
            view.font = AppTypography.body.scaledFont
            return view
        }()
        private lazy var descLabel: UILabel = {
           let view = UILabel()
            view.textColor = SWEDBANKAsset.Colors.text3.color
            view.font = AppTypography.title3.scaledFont
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
extension ContactsScreenView.ContactCellView {
    func configure(model: ContactsScreenContactCellViewModel) {
        titleLabel.text = model.contactText.localized()
        descLabel.text = model.contactDescription.localized()
        iconView.image = .init(systemName: model.contactIcon)?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = SWEDBANKAsset.Colors.accent2.color
        configure(padding: Constants.contentPadding)
    }
    
    func configure(padding: CGFloat) {
        contentView.setMargins(direction: .both, constant: padding)
    }
}

// MARK: Private
extension ContactsScreenView.ContactCellView {
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
        mainStack.addArrangedSubview(iconView)
        mainStack.setCustomSpacing(Constants.contentPadding, after: iconView)
        mainStack.addArrangedSubview(textsStack)
        textsStack.addArrangedSubview(titleLabel)
        textsStack.addArrangedSubview(descLabel)
    }
}
