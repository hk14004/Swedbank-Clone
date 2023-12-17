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

class OverviewScreenVC: UIViewController {
    // MARK: Properties
    lazy var rootView = OverviewScreenView.RootView()
    let viewModel: OverviewScreenVM
    private var cancelBag = Set<AnyCancellable>()
    private lazy var dataSource: DiffableDataSource = makeDataSource()
    private var initialRender = true
    
    // MARK: Lifecycle
    init(viewModel: OverviewScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.viewDidLoad()
    }
}

// MARK: Private
extension OverviewScreenVC {
    private func setup() {
        rootView.tableView.dataSource = dataSource
        dataSource.defaultRowAnimation = .fade
        bindOutput()
    }
    
    private func bindOutput() {
        viewModel.sectionPublisher
            .dropFirst()
            .receiveOnMainThread()
            .sink { [weak self] sections in
                self?.renderTableViewSections(sections)
            }
            .store(in: &cancelBag)
    }
    
    private func renderTableViewSections(_ sections: [OverviewScreenSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<OverviewScreenSection.Identifier, OverviewScreenSection.Cell>()
        snapshot.appendSections(sections.map({$0.identifier}))
        sections.forEach { section in
            snapshot.appendItems(section.cells, toSection: section.identifier)
        }
        dataSource.apply(snapshot, animatingDifferences: !initialRender)
        if initialRender {
            initialRender = false
        }
    }
}
