//
//  UserScreenVC.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import UIKit
import Combine
import DevToolsUI

class UserScreenVC: UIViewController {
    
    // MARK: Init
    
    init(viewModel: any UserScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "User"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    
    /// Private
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var dataSource: DiffableDataSource!
    private let viewModel: any UserScreenVM
    private var bag = Set<AnyCancellable>()
    private var initialRender = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startup()
    }
    
}

// MARK: Private

extension UserScreenVC {
    
    private func startup() {
        configureTableView()
        observeViewModel()
    }
    
    private func configureTableView() {
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.directionalLayoutMargins = .zero
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        registerTableViewCells()
        configureDataSource()
        tableView.delegate = self
    }
    
    private func registerTableViewCells() {
        tableView.register(DefaultTableViewCell.self,
                           forCellReuseIdentifier: DefaultTableViewCell.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = DiffableDataSource(viewModel: viewModel, tableView: tableView) { tableView, indexPath, item in
            switch item {
            case .navigation(let item):
                let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseID,
                                                         for: indexPath) as? DefaultTableViewCell
                cell?.accessoryType = .disclosureIndicator
                var configuration = cell?.defaultContentConfiguration()
                configuration?.text = item.title
                configuration?.textProperties.color = Asset.Colors.secondaryText.color
                cell?.contentConfiguration = configuration
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
    
    private func renderTableViewSections(_ sections: [UserScreenSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<UserScreenSection.Identifier, UserScreenSection.Cell>()
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

// MARK: Data source

fileprivate extension UserScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<UserScreenSection.Identifier, UserScreenSection.Cell> {
        
        private var viewModel: any UserScreenVM
        
        init(viewModel: any UserScreenVM, tableView: UITableView,
             cellProvider: @escaping UITableViewDiffableDataSource<UserScreenSection.Identifier, UserScreenSection.Cell>.CellProvider) {
            self.viewModel = viewModel
            super.init(tableView: tableView, cellProvider: cellProvider)
        }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return viewModel.sections[section].title
        }
    }
}

extension UserScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = viewModel.sections[indexPath.section].cells[indexPath.row]
        switch cell {
        case .navigation(let item):
            item.navigate()
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
