//
//  OverviewScreenExpensesCellViewModel.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsUI
import DevToolsCore
import Foundation

struct OverviewScreenExpensesCellViewModel: DevTableSectionCellModel {
    public var id: String
    public var detailsUrl: String
    public var spentAmount: Money
    public var spentCurrency: String
    // TOOD: Add chart data
}

extension OverviewScreenExpensesCellViewModel {
    var contentHash: Int {
        var hasher = Hasher()
        hasher.combine(id)
        hasher.combine(detailsUrl)
        hasher.combine(spentAmount)
        hasher.combine(spentCurrency)
        return hasher.finalize()
    }
}

extension OverviewScreenExpensesCellViewModel {
    static func == (lhs: OverviewScreenExpensesCellViewModel, rhs: OverviewScreenExpensesCellViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
