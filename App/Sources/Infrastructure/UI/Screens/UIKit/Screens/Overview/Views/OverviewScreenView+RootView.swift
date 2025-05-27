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

enum OverviewScreenView{}
extension OverviewScreenView {
    final class RootView: UIView {
        // MARK: Properties
        lazy var containerView: UIView = {
            let view = UIView()
            return view
        }()
        lazy var tableView: UITableView = {
            let view = UITableView()
            view.refreshControl = refreshControl
            return view
        }()
        lazy var profileButton = CustomerInitialsButton()
        lazy var notificationsButton = NotificationButton()
        private lazy var refreshControl = UIRefreshControl()
        
        // MARK: LifeCycle
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: Actions
        var didTapProfileButton: AnyPublisher<Void, Never> {
            profileButton.eventPublisher(for: .touchUpInside).eraseToAnyPublisher()
        }
        var didTapNotificationsButton: AnyPublisher<Void, Never> {
            notificationsButton.eventPublisher(for: .touchUpInside).eraseToAnyPublisher()
        }
        var didPullToRefresh: AnyPublisher<Bool, Never> {
            refreshControl.eventPublisher(for: .valueChanged)
                .map { [weak self] _ in
                    self?.refreshControl.isRefreshing ?? false
                }
                .eraseToAnyPublisher()
        }
        
        // MARK: Methods
        private func setup() {
            backgroundColor = SWEDBANKAsset.Colors.background1.color
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
            tableView.registerCell(BalanceCellView.self)
            tableView.registerCell(OfferCellView.self)
            tableView.registerCell(ExpensesCellView.self)
        }
        
        // TODO: Move to refresh control extension
        func configureIsLoading(_ isLoading: Bool) {
            if isLoading, refreshControl.isRefreshing == false  {
                refreshControl.beginRefreshing()
            } else if !isLoading, refreshControl.isRefreshing == true  {
                refreshControl.endRefreshing()
            }
        }
    }
}
