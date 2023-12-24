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
    
    class DiffableDataSource: UITableViewDiffableDataSource<OverviewScreenSection.SectionID, Int> {
        private var viewModel: OverviewScreenVM
        
        init(
            viewModel: OverviewScreenVM,
            tableView: UITableView,
            cellProvider: @escaping UITableViewDiffableDataSource<OverviewScreenSection.SectionID, Int>.CellProvider
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
            guard let cell = self.viewModel.sections.flatMap({ section in
                section.cells
            }).first(where: { cell in
                cell.hashValue == itemIdentifier
            }) else {
                return UITableViewCell()
            }
            switch cell {
            case .cardBalance(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = model.title
                cell.detailTextLabel?.text = model.text
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
