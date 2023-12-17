//
//  DashboardScreenView + RootView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import DevToolsUI

enum DashboardScreenView{}
extension DashboardScreenView {
    final class RootView: UIView {
        // MARK: Properties
        lazy var navigationBarView: NavigationBarView = {
            let view = NavigationBarView()
            return view
        }()
        lazy var containerView: UIView = {
            let view = UIView()
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
            backgroundColor = SWEDBANKAsset.Colors.background1.color
            setupContainerView()
            setupNavigationBar()
        }
        
        private func setupContainerView() {
            addSubview(containerView)
            containerView.snp.makeConstraints { make in
                make.edges.equalToSuperview { superView in
                    superView.safeAreaLayoutGuide
                }
            }
        }
        
        private func setupNavigationBar() {
            containerView.addSubview(navigationBarView)
            navigationBarView.snp.makeConstraints { make in
                make.top.horizontalEdges.equalToSuperview()
            }
        }
    }
}
