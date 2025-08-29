//
//  ContactsScreenVC+DataSource.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI

extension ContactsScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<ContactsScreenSection.SectionID, Int> {
        // MARK: Properties
        private var viewModel: ContactsScreenVM
        
        // MARK: Lifecycle
        init(
            viewModel: ContactsScreenVM,
            tableView: UITableView,
            cellProvider: @escaping UITableViewDiffableDataSource<ContactsScreenSection.SectionID, Int>.CellProvider
        ) {
            self.viewModel = viewModel
            super.init(tableView: tableView, cellProvider: cellProvider)
            defaultRowAnimation = .fade
        }
    }
    
    func makeDataSource() -> DiffableDataSource {
        DiffableDataSource(
            viewModel: viewModel,
            tableView: rootView.tableView
        ) { [weak self] tableView, indexPath, itemIdentifier in
            guard
                let self,
                let section = viewModel.tableSnapshot.value.sections[safe: indexPath.section],
                let cell = section.cells[safe: indexPath.row]
            else {
                return UITableViewCell()
            }
            switch cell {
            case .contactItem(let model):
                let cell: ContactsScreenView.ContactCellView = tableView.dequeueReusableCell(for: indexPath)
                cell.configure(model: model)
                return cell
            }
        }
    }
}
