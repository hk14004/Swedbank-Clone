//
//  ContactsScreenVC.swift
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

class ContactsScreenVC: RuntimeLocalizedUIViewController {
    // MARK: Properties
    lazy var rootView = ContactsScreenView.RootView()
    let viewModel: ContactsScreenVM
    private var cancelBag = Set<AnyCancellable>()
    lazy var dataSource = makeDataSource()
    private var initialRender = true
    
    // MARK: Lifecycle
    init(viewModel: ContactsScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.viewDidLoad()
        runtimeLocalizedTitleKey = "Tabbar.Tabs.Contacts.title"
    }
    
    override func updateRuntimeLocalizedStrings() {
        super.updateRuntimeLocalizedStrings()
        rootView.tableView.reloadData()
    }
}

// MARK: Private
extension ContactsScreenVC {
    private func setup() {
        rootView.tableView.dataSource = dataSource
        bindActions()
        bindOutput()
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
    
    private func bindActions() {}
    
    private func applyChanges(changeSnapshot: ContactsScreenSectionChangeSnapshot) {
        let sections = changeSnapshot.sections
        let changeSet = changeSnapshot.changes
        var snapshot = NSDiffableDataSourceSnapshot<ContactsScreenSection.SectionID, Int>()
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
