//
//  SplashView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SnapKit

extension SplashScreenView {
    final class RootView: UIView {
        // MARK: Constants
        enum Constants {
            static let logoHorizontalInset = 0
        }
        
        // MARK: Views
        private lazy var logoView = {
           let view = UIImageView(image: AppImages.swedbankLogo.image)
            view.contentMode = .scaleAspectFit
            return view
        }()
        
        // MARK: Lifecycle
        
        init() {
            super.init(frame: .zero)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: Setup
        
        private func setupView() {
            setupLogoView()
        }
        
        private func setupLogoView() {
            addSubview(logoView)
            logoView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.horizontalEdges.equalToSuperview().inset(Constants.logoHorizontalInset)
            }
        }
    }
}
