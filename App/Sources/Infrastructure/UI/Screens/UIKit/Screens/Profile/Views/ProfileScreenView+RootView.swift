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

enum ProfileScreenView{}
extension ProfileScreenView {
    final class RootView: UIView {
        // MARK: Properties
        lazy var containerView: UIView = {
            let view = UIView()
            return view
        }()
        lazy var tableView: UITableView = {
            let view = UITableView()
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
            backgroundColor = AppColors.background1.color
            setupContainerView()
            setupTableView()
        }
        
        private func setupContainerView() {
            addSubview(containerView)
            containerView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        private func setupTableView() {
            containerView.addSubview(tableView)
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            tableView.separatorInset = .zero
            tableView.registerCell(LogoutCell.self)
        }
    }
}
