//
//  LockedDashboardView+RootView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SnapKit
import Combine
import DevToolsUI

enum LockedDashboardView {
    class RootView: UIView {
        // MARK: - Views
        private lazy var imageView: UIImageView = {
            let view = UIImageView(frame: .zero)
            view.contentMode = .scaleAspectFit
            return view
        }()
        private lazy var titleView: PrimaryLabel = {
            let view = PrimaryLabel()
            view.font = AppTypography.title.scaledFont
            view.adjustsFontForContentSizeCategory = true
            return view
        }()
        private lazy var subtitleView: PrimaryLabel = {
            let view = PrimaryLabel()
            view.font = AppTypography.body.scaledFont
            view.adjustsFontForContentSizeCategory = true
            return view
        }()
        private lazy var loginButton: PrimaryButton = {
            let view = PrimaryButton()
            view.setTitle("Login", for: .normal)
            return view
        }()
        private lazy var middleVstack: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            return view
        }()
        
        // MARK: - Lifecycle
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupMiddleStack()
            setupLoginButtonView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Actions
        
        var didTapLoginButton: AnyPublisher<Void, Never> {
            loginButton.eventPublisher(for: .touchUpInside).eraseToAnyPublisher()
        }
        
        // MARK: Setup
        private func setupMiddleStack() {
            addSubview(middleVstack)
            middleVstack.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.horizontalEdges.equalToSuperview()
            }
            middleVstack.addArrangedSubview(imageView)
            middleVstack.addArrangedSubview(titleView)
            middleVstack.addArrangedSubview(subtitleView)
        }
        
        private func setupLoginButtonView() {
            addSubview(loginButton)
            loginButton.snp.makeConstraints { make in
                make.bottom.horizontalEdges.equalToSuperview().inset(16)
            }
        }
        
        // MARK: Update
        func update(config: LockedDashboardPresentationConfig) {
            let image = UIImage(named: config.tabDescriptionIconName)
            imageView.image = image
            titleView.text = config.title
            subtitleView.text = config.subtitle
            backgroundColor = .brown
        }
    }
}
