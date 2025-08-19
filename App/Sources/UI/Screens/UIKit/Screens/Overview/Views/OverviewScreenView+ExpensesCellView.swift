//
//  OverviewScreenView+ExpensesCellView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsLocalization

extension OverviewScreenView {
    final class ExpensesCellView: UITableViewCell {
        enum Constants {
            static let contentPadding: CGFloat = 16
            static let currencyPadding: CGFloat = 4
            static let expensesHeight: CGFloat = 24
        }
        private lazy var mainStack: UIStackView = {
           let view = UIStackView()
            view.axis = .vertical
            return view
        }()
        private lazy var topHStack: UIStackView = {
           let view = UIStackView()
            view.axis = .horizontal
            return view
        }()
        private lazy var bottomHStack: UIStackView = {
           let view = UIStackView()
            view.axis = .horizontal
            return view
        }()
        private lazy var leftVStack: UIStackView = {
           let view = UIStackView()
            view.axis = .vertical
            return view
        }()
        private lazy var rightVStack: UIStackView = {
           let view = UIStackView()
            view.axis = .vertical
            return view
        }()
        private lazy var topTitleLabel: UILabel = {
           let view = RuntimeLocalizedLabel()
            view.runtimeLocalizedKey = AppStrings.Screen.Overview.Expenses.titleKey
            view.textColor = AppColors.accent1.color
            view.font = AppTypography.title2.scaledFont
            return view
        }()
        private lazy var detailsLabel: UILabel = {
            let view = RuntimeLocalizedLabel()
            view.runtimeLocalizedKey = AppStrings.Screen.Overview.Expenses.detailsKey
            view.textColor = AppColors.accent2.color
            view.font = AppTypography.link1.scaledFont
            return view
        }()
        private lazy var monthLabel: UILabel = {
            let view = RuntimeLocalizedLabel()
            view.runtimeLocalizedKey = AppStrings.Screen.Overview.Expenses.thisMonthKey
            view.textColor = AppColors.text3.color
            view.font = AppTypography.title3.scaledFont
            return view
        }()
        private lazy var currencyAmountView: CurrencyAmountView = {
            let view = CurrencyAmountView()
            view.configure(font: AppTypography.body.scaledFont)
            view.configure(textColor: AppColors.text2.color)
            return view
        }()
        private lazy var spentLabel: UILabel = {
            let view = RuntimeLocalizedLabel()
            view.runtimeLocalizedKey = AppStrings.Screen.Overview.Expenses.spentKey
            view.textColor = AppColors.text3.color
            view.font = AppTypography.title3.scaledFont
            return view
        }()
        private lazy var expensesView: ExpensesView = {
            let view = ExpensesView()
            view.snp.makeConstraints { make in
                make.height.equalTo(Constants.expensesHeight)
            }
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
extension OverviewScreenView.ExpensesCellView {
    func configure(model: OverviewScreenExpensesCellViewModel) {
        currencyAmountView.configure(amount: "\(model.spentAmount)", currency: model.spentCurrency)
        configure(padding: Constants.contentPadding)
    }
    
    func configure(padding: CGFloat) {
        contentView.setMargins(direction: .both, constant: padding)
    }
}

// MARK: Private
extension OverviewScreenView.ExpensesCellView {
    private func setup() {
        selectionStyle = .none
        setupMainStack()
        setupMainStackContent()
        setupTopStackContent()
        setupBottomHStackContent()
        setupLeftVStackContent()
        setupRightVStackContent()
    }
    
    private func setupMainStack() {
        contentView.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView.layoutMarginsGuide)
        }
    }
    
    private func setupTopStackContent() {
        topHStack.addArrangedSubview(topTitleLabel)
        topHStack.addArrangedSubview(UIView())
        topHStack.addArrangedSubview(detailsLabel)
    }
    
    private func setupMainStackContent() {
        mainStack.addArrangedSubview(topHStack)
        mainStack.addArrangedSubview(bottomHStack)
        mainStack.setCustomSpacing(Constants.contentPadding, after: topHStack)
    }
    
    private func setupBottomHStackContent() {
        bottomHStack.addArrangedSubview(leftVStack)
        bottomHStack.addArrangedSubview(rightVStack)
        bottomHStack.setCustomSpacing(Constants.contentPadding, after: leftVStack)
    }
    
    private func setupLeftVStackContent() {
        leftVStack.addArrangedSubview(monthLabel)
        leftVStack.addArrangedSubview(.init())
        leftVStack.addArrangedSubview(currencyAmountView)
    }
    
    private func setupRightVStackContent() {
        rightVStack.addArrangedSubview(spentLabel)
        rightVStack.addArrangedSubview(.init())
        rightVStack.addArrangedSubview(expensesView)
        rightVStack.setCustomSpacing(Constants.contentPadding / 3, after: spentLabel)
    }
}
