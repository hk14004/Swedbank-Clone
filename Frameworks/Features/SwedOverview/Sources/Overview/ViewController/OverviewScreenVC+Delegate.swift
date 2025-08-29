//
//  OverviewScreenVC+Delegate.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit

extension OverviewScreenVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = viewModel.tableSnapshot.value.sections[safe: indexPath.section]?.cells[safe:indexPath.row] else {
            return
        }
        
        switch cell {
        case .cardBalance(_):
            return
        case .offer(let cellViewModel):
            cellViewModel.didTap?()
        case .expenses(_):
            return
        }
    }
}
