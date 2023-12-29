//
//  PrimaryNavigationBarView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsLocalization

class DashboardNavigationBarView: UIView {
    enum Constants {
        static let buttonSpacing: CGFloat = 16
    }
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var mainHorizontalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        return view
    }()
    private lazy var buttonHStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = Constants.buttonSpacing
        return view
    }()
    private lazy var titleLabel: RuntimeLocalizedLabel = {
        let view = RuntimeLocalizedLabel()
        view.textColor = SWEDBANKAsset.Colors.orange1.color
        view.font = UIFont.systemFont(ofSize: 17, weight: .bold)
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

extension DashboardNavigationBarView {
    private func setup() {
        setupContainerView()
        setupHorizontalStackView()
        setupTitleLabel()
        setupButtonStackView()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupHorizontalStackView() {
        containerView.addSubview(mainHorizontalStack)
        mainHorizontalStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        mainHorizontalStack.addArrangedSubview(titleLabel)
    }
    
    private func setupButtonStackView() {
        mainHorizontalStack.addArrangedSubview(buttonHStack)
    }
}

// MARK: Public
extension DashboardNavigationBarView {
    func configure(title: String) {
        titleLabel.runtimeLocalizedKey = title
    }
    
    func configureActions(buttons: [UIButton]) {
        buttonHStack.arrangedSubviews.forEach { view in
            buttonHStack.removeArrangedSubview(view)
        }
        buttons.forEach { button in
            buttonHStack.addArrangedSubview(button)
        }
    }
}
