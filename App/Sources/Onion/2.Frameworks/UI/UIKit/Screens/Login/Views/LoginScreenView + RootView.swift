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
            view.backgroundColor = .blue
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
            setupLogo()
            setupInputFieldContainer()
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
                make.height.equalTo(100)
                make.horizontalEdges.equalToSuperview().inset(32)
                make.top.equalTo(logoView.snp.bottom)
            }
        }
    }
}
