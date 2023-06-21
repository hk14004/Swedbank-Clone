//
//  SettingsScreenVC.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import UIKit
import Combine
import DevToolsUI
import DevToolsLocalization
import DevToolsNavigation

class SettingsScreenVC: RuntimeLocalizedUIViewController {
    
    // MARK: Init
    
    init(viewModel: any SettingsScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    
    /// Private
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private var dataSource: DiffableDataSource!
    private let viewModel: any SettingsScreenVM
    private var bag = Set<AnyCancellable>()
    private var initialRender = true
    var coordinator: NavigationCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startup()
    }
    
    override func updateRuntimeLocalizedStrings() {
        super.updateRuntimeLocalizedStrings()
        tableView.reloadData()
    }
}

// MARK: Private

extension SettingsScreenVC {
    
    private func startup() {
        runtimeLocalizedTitleKey = "Screen.Settings.title"
        configureTableView()
        observeViewModel()
    }
    
    private func configureTableView() {
        tableView.backgroundColor = UIColor.systemBackground
        tableView.rowHeight = UITableView.automaticDimension
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
        tableView.register(UINib.instanciateNib(type: BasicHeaderFooterView.self),
                           forHeaderFooterViewReuseIdentifier: BasicHeaderFooterView.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = DiffableDataSource(viewModel: viewModel, tableView: tableView) { tableView, indexPath, item in
            switch item {
            case .deleteProfile(let item):
                let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseID,
                                                         for: indexPath) as? DefaultTableViewCell
                cell?.accessoryType = .disclosureIndicator
                var configuration = cell?.defaultContentConfiguration()
                configuration?.text = item.title.runtimeLocalized()
                configuration?.textProperties.color = Asset.Colors.color1.color
                cell?.contentConfiguration = configuration
                return cell
            case .currentLanguage:
                let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseID,
                                                         for: indexPath) as? DefaultTableViewCell
                cell?.accessoryType = .disclosureIndicator
                var configuration = cell?.defaultContentConfiguration()
                configuration?.image = UIImage(named: Globals.makeLanguageFlagName(language: RuntimeStringFileLocalization.shared.getCurrentLanguage()))
                configuration?.imageProperties.maximumSize = .init(width: 24, height: 24)
                configuration?.text = Globals.makeLanguageNameKey(language: RuntimeStringFileLocalization.shared.getCurrentLanguage()).runtimeLocalized()
                configuration?.textProperties.color = Asset.Colors.secondaryText.color
                cell?.contentConfiguration = configuration
                return cell
            case .navigation(let item):
                let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseID,
                                                         for: indexPath) as? DefaultTableViewCell
                cell?.accessoryType = .disclosureIndicator
                var configuration = cell?.defaultContentConfiguration()
                configuration?.text = item.title.runtimeLocalized()
                configuration?.textProperties.color = Asset.Colors.secondaryText.color
                cell?.contentConfiguration = configuration
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
    
    private func renderTableViewSections(_ sections: [SettingsScreenSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<SettingsScreenSection.Identifier, SettingsScreenSection.Cell>()
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

fileprivate extension SettingsScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<SettingsScreenSection.Identifier, SettingsScreenSection.Cell> {
        
        private var viewModel: any SettingsScreenVM
        
        init(viewModel: any SettingsScreenVM, tableView: UITableView,
             cellProvider: @escaping UITableViewDiffableDataSource<SettingsScreenSection.Identifier, SettingsScreenSection.Cell>.CellProvider) {
            self.viewModel = viewModel
            super.init(tableView: tableView, cellProvider: cellProvider)
        }
    }
}

extension SettingsScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = viewModel.sections[indexPath.section].cells[indexPath.row]
        switch cell {
        case .navigation(let item):
            item.navigate()
        case .currentLanguage(let item):
            item.navigate()
        case .deleteProfile(let item):
            item.navigate()
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: BasicHeaderFooterView.reuseID) as? BasicHeaderFooterView
        let titleKey = viewModel.sections[section].title
        headerView?.titleLabel.runtimeLocalizedKey = titleKey
        if titleKey.isEmpty {
            return nil
        }
        return headerView
    }
}
