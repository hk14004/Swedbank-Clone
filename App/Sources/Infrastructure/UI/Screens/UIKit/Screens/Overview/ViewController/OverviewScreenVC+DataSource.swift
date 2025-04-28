//
//  OverviewScreenVC+DataSource.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import DevToolsUI

extension OverviewScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<OverviewScreenSection.SectionID, Int> {
        // MARK: Properties
        private var viewModel: OverviewScreenVM
        
        // MARK: Lifecycle
        init(
            viewModel: OverviewScreenVM,
            tableView: UITableView,
            cellProvider: @escaping UITableViewDiffableDataSource<OverviewScreenSection.SectionID, Int>.CellProvider
        ) {
            self.viewModel = viewModel
            super.init(tableView: tableView, cellProvider: cellProvider)
            self.defaultRowAnimation = .fade
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
            case .cardBalance(let model):
                let cell: OverviewScreenView.BalanceCellView = tableView.dequeueReusableCell(for: indexPath)
                cell.configure(model: model)
                return cell
            case .offer(let model):
                let cell: OverviewScreenView.OfferCellView = tableView.dequeueReusableCell(for: indexPath)
                cell.configure(model: model)
                return cell
            case .expenses(let model):
                let cell: OverviewScreenView.ExpensesCellView = tableView.dequeueReusableCell(for: indexPath)
                cell.configure(model: model)
                return cell
            }
        }
    }
}
