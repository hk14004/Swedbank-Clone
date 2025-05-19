//
//  DashboardScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import SwedInterfaceAdapters
import DevToolsCore
import DevToolsUI
import DevToolsLocalization

class OverviewScreenVC: RuntimeLocalizedUIViewController {
    // MARK: Properties
    let viewModel: OverviewScreenVM
    lazy var rootView = OverviewScreenView.RootView()
    lazy var dataSource = makeDataSource()
    private var cancelBag = Set<AnyCancellable>()
    private var initialRender = true
    
    // MARK: Lifecycle
    init(viewModel: OverviewScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setup()
        viewModel.viewDidLoad()
    }
}

// MARK: Private
extension OverviewScreenVC {
    private func setup() {
        rootView.tableView.dataSource = dataSource
        bindActions()
        bindOutput()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        runtimeLocalizedTitleKey = AppStrings.Tabbar.Tabs.Overview.titleKey
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: rootView.profileButton),
            UIBarButtonItem(customView: rootView.notificationsButton)
        ]
        rootView.profileButton.configure(text: viewModel.customer.getInitials())
    }
    
    private func bindOutput() {
        viewModel.sectionsChangePublisher
            .receiveOnMainThread()
            .sink { [weak self] snapshot in
                guard let self = self else { return }
                applyChanges(changeSnapshot: snapshot)
            }
            .store(in: &cancelBag)
    }
    
    private func bindActions() {
        bindNotificationsTapAction()
        bindProfileTapAction()
    }
    
    private func bindNotificationsTapAction() {
        rootView.didTapNotificationsButton
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.onNotificationsTapped()
            })
            .store(in: &cancelBag)
    }
    
    private func bindProfileTapAction() {
        rootView.didTapProfileButton
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.onProfileTapped()
            })
            .store(in: &cancelBag)
    }
    
    private func applyChanges(changeSnapshot: OverviewScreenSectionChangeSnapshot) {
        let sections = changeSnapshot.sections
        let changeSet = changeSnapshot.changes
        var snapshot = NSDiffableDataSourceSnapshot<OverviewScreenSection.SectionID, Int>()
        snapshot.appendSections(sections.map{$0.id})
        sections.forEach { section in
            snapshot.appendItems(section.cells.map{$0.hashValue}, toSection: section.id)
        }
        snapshot.reloadItems(changeSet.updated)
        dataSource.apply(snapshot, animatingDifferences: !initialRender)
        if initialRender {
            initialRender = false
        }
    }
}
