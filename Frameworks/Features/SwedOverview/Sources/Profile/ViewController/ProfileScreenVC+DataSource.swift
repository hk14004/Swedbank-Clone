//
//  ProfileScreenVC+DataSource.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI

extension ProfileScreenVC {
    class DiffableDataSource: UITableViewDiffableDataSource<ProfileScreenSection.SectionID, Int> {
        // MARK: Properties
        private var viewModel: ProfileScreenVM
        
        // MARK: Lifecycle
        init(
            viewModel: ProfileScreenVM,
            tableView: UITableView,
            cellProvider: @escaping UITableViewDiffableDataSource<ProfileScreenSection.SectionID, Int>.CellProvider
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
            case .navigation(let model):
                let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "123")
                cell.textLabel?.text = model.title
                cell.detailTextLabel?.text = model.subtitle
                return cell
            case .logout:
                let cell: ProfileScreenView.LogoutCell = tableView.dequeueReusableCell(for: indexPath)
                cell.logoutButton.eventPublisher(for: .touchUpInside)
                    .receiveOnMainThread()
                    .sink { [weak self] _ in
                        self?.viewModel.onLogoutTapped()
                    }
                    .store(in: &cell.cancelBag)
                return cell
            }
        }
    }
}
