//
//  OverviewScreenVC.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import UIKit
import Combine
import DevToolsUI

class OverviewScreenVC: UIViewController {
    
    // MARK: Init
    
    init(viewModel: any OverviewScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    
    /// Private
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var dataSource: DiffableDataSource!
    private let viewModel: any OverviewScreenVM
    private var bag = Set<AnyCancellable>()
    private var mainNavigationBarView = MainNavigationBarView()
    private var initialRender = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startup()
    }
    
}

// MARK: Private

extension OverviewScreenVC {
    
    private func startup() {
        configureMainNavigationBarView()
        configureTableView()
        observeViewModel()
    }
    
    private func configureTableView() {
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.directionalLayoutMargins = .zero
        tableView.allowsSelection = false
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: mainNavigationBarView.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        registerTableViewCells()
        configureDataSource()
    }
    
    private func registerTableViewCells() {
        tableView.register(UINib.instanciateNib(type: CardBalanceTableViewCell.self),
                           forCellReuseIdentifier: CardBalanceTableViewCell.reuseID)
        tableView.register(DefaultTableViewCell.self,
                           forCellReuseIdentifier: DefaultTableViewCell.reuseID)
        tableView.register(UINib.instanciateNib(type: ExpensesTableViewCell.self),
                           forCellReuseIdentifier: ExpensesTableViewCell.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = DiffableDataSource(viewModel: viewModel, tableView: tableView) { tableView, indexPath, item in
            switch item {
            case .cardBalance:
                let cell = tableView.dequeueReusableCell(withIdentifier: CardBalanceTableViewCell.reuseID,
                                                         for: indexPath) as? CardBalanceTableViewCell
                //                cell?.bindTo(viewModel: vm)
                return cell
            case .offer:
                let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseID,
                                                         for: indexPath) as? DefaultTableViewCell
                cell?.accessoryType = .disclosureIndicator
                var configuration = cell?.defaultContentConfiguration()
                configuration?.text = "Check out this deal bro you will like it"
                configuration?.textProperties.color = Asset.Colors.secondaryText.color
                cell?.contentConfiguration = configuration
                cell?.contentView.setMargins(direction: .both, constant: 16, ignoreSuperViewMargins: true)
                return cell
            case .expenses:
                let cell = tableView.dequeueReusableCell(withIdentifier: ExpensesTableViewCell.reuseID,
                                                         for: indexPath) as? ExpensesTableViewCell
                //                cell?.bindTo(viewModel: vm)
                cell?.contentView.setMargins(direction: .both, constant: 16, ignoreSuperViewMargins: true)
                return cell
            }
        }
        dataSource.defaultRowAnimation = .fade
    }
    
    private func observeViewModel() {
        viewModel.sectionsPublisher.receive(on: DispatchQueue.main).sink { [weak self] sections in
            self?.renderTableViewSections(sections)
        }.store(in: &bag)
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
    
    private func configureMainNavigationBarView() {
        view.addSubview(mainNavigationBarView)
        mainNavigationBarView.translatesAutoresizingMaskIntoConstraints = false
        mainNavigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainNavigationBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainNavigationBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainNavigationBarView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        mainNavigationBarView.updateTitle(key: "Tabbar.Tabs.Overview.title")
        mainNavigationBarView.viewDidLoad()
        mainNavigationBarView.configureDefault()
    }
    
    private func makeItem1() -> UIView {
        let img = UIImage(systemName: "bell.fill")!
        let button = UIImageView(image: img)
        button.tintColor = Asset.Colors.primaryText.color
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 26).isActive = true
        return button
    }
    
    private func makeItem2() -> UIView {
        let img = UIImage(systemName: "person.fill")!
        let button = UIImageView(image: img)
        button.tintColor = Asset.Colors.primaryText.color
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 26).isActive = true
        return button
    }
}

// MARK: Data source

fileprivate extension OverviewScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<OverviewScreenSection.Identifier, OverviewScreenSection.Cell> {
        
        private var viewModel: any OverviewScreenVM
        
        init(viewModel: any OverviewScreenVM, tableView: UITableView,
             cellProvider: @escaping UITableViewDiffableDataSource<OverviewScreenSection.Identifier, OverviewScreenSection.Cell>.CellProvider) {
            self.viewModel = viewModel
            super.init(tableView: tableView, cellProvider: cellProvider)
        }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return nil
        }
    }
}
