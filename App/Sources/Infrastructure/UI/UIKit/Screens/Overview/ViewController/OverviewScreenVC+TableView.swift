//
//  OverviewScreenVC+TableView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters

extension OverviewScreenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].cells.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.sections[indexPath.section].cells[indexPath.row]
        switch item {
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
