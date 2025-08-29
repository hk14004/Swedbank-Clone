//
//  OverviewScreenVC+DataSource.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI
import DevToolsCore

extension OverviewScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<OverviewScreenSection.SectionID, Int> {
        // MARK: Properties
        private var viewModel: OverviewScreenVM
        private var initialRender = true
        
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
        
        func apply(_ snapshot: OverviewScreenTableSnapshot) {
            var nativeSnapshot = NSDiffableDataSourceSnapshot<OverviewScreenSection.SectionID, Int>()
            nativeSnapshot.appendSections(snapshot.sections.map { $0.id })
            snapshot.sections.forEach { section in
                nativeSnapshot.appendItems(section.cells.map { $0.hashValue }, toSection: section.id)
            }
            nativeSnapshot.reloadItems(snapshot.changes.updated)
            apply(nativeSnapshot, animatingDifferences: !initialRender)
            initialRender = false
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
