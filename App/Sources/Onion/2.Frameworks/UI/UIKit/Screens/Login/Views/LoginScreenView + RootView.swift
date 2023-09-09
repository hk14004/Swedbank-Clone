//
//  LoginScreenView + RootView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

extension LoginScreenView {
    final class RootView: UIView {
        private lazy var logoView: UIImageView = {
            let image = SWEDBANKAsset.Images.swedbankLogo.image
            let view = UIImageView(image: image)
            view.contentMode = .scaleAspectFit
            return view
        }()
        private lazy var inputFieldContainer: UIView = {
            let view = UIView(frame: .zero)
            return view
        }()
        private lazy var usernameField: PrimaryTextField = {
            let view = PrimaryTextField()
            view.placeholder = "Username!"
            return view
        }()
        private lazy var passwordField: PrimaryTextField = {
            let view = PrimaryTextField()
            view.placeholder = "password!"
            return view
        }()
        private lazy var loginButton: PrimaryButton = {
            let view = PrimaryButton()
            view.setTitle("Login", for: .normal)
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setup() {
            backgroundColor = .white
            setupLogo()
            setupInputFieldContainer()
            setupUsernameView()
            setupPasswordView()
            setupLoginButtonView()
        }
        
        private func setupLogo() {
            addSubview(logoView)
            logoView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.horizontalEdges.equalToSuperview().inset(32)
            }
        }
        
        private func setupInputFieldContainer() {
            addSubview(inputFieldContainer)
            inputFieldContainer.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
                make.horizontalEdges.equalToSuperview().inset(32)
                make.top.equalTo(logoView.snp.bottom)
            }
        }
        
        private func setupUsernameView() {
            inputFieldContainer.addSubview(usernameField)
            usernameField.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.horizontalEdges.equalToSuperview()
            }
        }
        
        private func setupPasswordView() {
            inputFieldContainer.addSubview(passwordField)
            passwordField.snp.makeConstraints { make in
                make.top.equalTo(usernameField.snp.bottom)
                make.horizontalEdges.equalToSuperview()
            }
        }
        private func setupLoginButtonView() {
            inputFieldContainer.addSubview(loginButton)
            loginButton.snp.makeConstraints { make in
                make.top.equalTo(passwordField.snp.bottom).offset(16)
                make.bottom.horizontalEdges.equalToSuperview()
            }
        }
    }
}
