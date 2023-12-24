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

class OverviewScreenVC: UIViewController {
    // MARK: Properties
    lazy var rootView = OverviewScreenView.RootView()
    let viewModel: OverviewScreenVM
    private var cancelBag = Set<AnyCancellable>()
    
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
        rootView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setup()
        viewModel.viewDidLoad()
    }
}

// MARK: Private
extension OverviewScreenVC {
    private func setup() {
        rootView.tableView.dataSource = self
        bindOutput()
    }
    
    private func bindOutput() {
        viewModel.sectionsReloadPublisher
            .dropFirst()
            .receiveOnMainThread()
            .sink { [weak self] in
                self?.rootView.tableView.reloadData()
            }
            .store(in: &cancelBag)
        
        viewModel.sectionsChangePublisher
            .receiveOnMainThread()
            .sink { [weak self] change in
                self?.rootView.tableView.animateContentChange(change)
            }
            .store(in: &cancelBag)
    }
}

public extension UITableView {
    func animateContentChange(_ change: DevChangeSet, completion: ((Bool)->())? = nil) {
        performBatchUpdates {
            deleteRows(at: change.removed, with: .fade)
            insertRows(at: change.inserted, with: .fade)
            change.moved.forEach { move in
                moveRow(at: move.from, to: move.to)
            }
        } completion: { [weak self] completed in
            guard let self = self else {
                completion?(completed)
                return
            }
            performBatchUpdates {
                self.reloadRows(at: change.updated, with: .fade)
            } completion: { completed in
                completion?(completed)
            }
        }
    }
}
