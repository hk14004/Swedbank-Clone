//
//  ContactsScreenVC+DataSource.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
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
        }
    }
    
    func makeDataSource() -> DiffableDataSource {
        DiffableDataSource(
            viewModel: viewModel,
            tableView: rootView.tableView
        ) { tableView, indexPath, itemIdentifier in
            // TODO: Improve
            guard let cell = self.viewModel.sections.flatMap({ section in
                section.cells
            }).first(where: { cell in
                cell.hashValue == itemIdentifier
            }) else {
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
