//
//  OverviewScreenSection.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsUI
import DevToolsCore

struct OverviewScreenSection: DevTableSection {
    enum SectionID: String, CaseIterable {
        case accounts
        case expenses
        case offers
        
        var order: Int {
            switch self {
            case .accounts:
                return 0
            case .expenses:
                return 1
            case .offers:
                return 2
            }
        }
    }
    
    enum Cell: DevTableSectionCell {
        case cardBalance(OverviewScreenBalanceCellViewModel)
        case offer(OverviewScreenOfferCellViewModel)
        case expenses(OverviewScreenExpensesCellViewModel)
    }
    
    let id: SectionID
    var title: String
    var cells: [Cell]
    
    init(id: SectionID, title: String = "", cells: [Cell]) {
        self.id = id
        self.title = title
        self.cells = cells
    }
}
