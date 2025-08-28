//
//  OverviewScreenBalanceCell.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsUI
import DevToolsCore

struct OverviewScreenBalanceCellViewModel: DevTableSectionCellModel {
    public var iban: String
    public var amount: Money
    public var currencyCode: String
}

extension OverviewScreenBalanceCellViewModel {
    var contentHash: Int {
        var hasher = Hasher()
        hasher.combine(iban)
        hasher.combine(amount)
        hasher.combine(currencyCode)
        return hasher.finalize()
    }
}

extension OverviewScreenBalanceCellViewModel {
    static func == (lhs: OverviewScreenBalanceCellViewModel, rhs: OverviewScreenBalanceCellViewModel) -> Bool {
        lhs.iban == rhs.iban
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iban)
    }
}
