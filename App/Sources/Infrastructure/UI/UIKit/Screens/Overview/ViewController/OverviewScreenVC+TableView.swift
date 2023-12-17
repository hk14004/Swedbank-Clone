//
//  OverviewScreenVC+TableView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters

extension OverviewScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<OverviewScreenSection.Identifier, OverviewScreenSection.Cell> {
        
        private var viewModel: OverviewScreenVM
        
        init(
            viewModel: OverviewScreenVM,
            tableView: UITableView,
            cellProvider: @escaping UITableViewDiffableDataSource<OverviewScreenSection.Identifier, OverviewScreenSection.Cell>.CellProvider
        ) {
            self.viewModel = viewModel
            super.init(tableView: tableView, cellProvider: cellProvider)
        }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return nil
        }
    }
    
    func makeDataSource() -> DiffableDataSource {
        DiffableDataSource(
            viewModel: viewModel,
            tableView: rootView.tableView
        ) { tableView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .cardBalance:
                let cell = UITableViewCell()
                cell.textLabel?.text = "cardbalance"
                return cell
            case .offer:
                let cell = UITableViewCell()
                cell.textLabel?.text = "offer"
                return cell
            case .expenses:
                let cell = UITableViewCell()
                cell.textLabel?.text = "expenses"
                return cell
            }
        }
    }
}
