//
//  SplashView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

extension SplashView {
    final class RootView: UIView {
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
            backgroundColor = .cyan
        }
        
    }
}
