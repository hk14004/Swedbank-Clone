//
//  DashboardScreenView+NavigationBarView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine

extension DashboardScreenView {
    final class NavigationBarView: UIView {
        enum Constants {
            static let padding: CGFloat = 16
        }
        // MARK: Properties
        private let primaryNavigationBarView = DashboardNavigationBarView()
        private var config: DashboardNavigationBarView.DefaultConfiguration?
        var notificationButtonTapPublisher: AnyPublisher<Void, Never> {
            config?.notificationButton.eventPublisher(for: .touchUpInside).eraseToAnyPublisher() ?? .empty()
        }
        var profileButtonTapPublisher: AnyPublisher<Void, Never> {
            config?.profilebutton.eventPublisher(for: .touchUpInside).eraseToAnyPublisher() ?? .empty()
        }
        
        // MARK: Lifecycle
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

// MARK: Private
extension DashboardScreenView.NavigationBarView {
    private func setup() {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        addSubview(primaryNavigationBarView)
        primaryNavigationBarView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(Constants.padding)
        }
        primaryNavigationBarView.configure(title: "Tabbar.Tabs.Overview.title")
        config = primaryNavigationBarView.configureDefault()
    }
}
