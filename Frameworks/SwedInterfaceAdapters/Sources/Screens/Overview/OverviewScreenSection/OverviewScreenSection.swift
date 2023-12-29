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

public class OverviewScreenSection: DevTableSection {
    public enum SectionID: String, CaseIterable {
        case overview
    }
    
    public enum Cell: DevTableSectionCell {
        case cardBalance(OverviewScreenBalanceCellViewModel)
        case offer
        case expenses
    }
    
    public let id: SectionID
    public var title: String
    public var cells: [Cell]
    
    public init(id: SectionID, title: String, cells: [Cell]) {
        self.id = id
        self.title = title
        self.cells = cells
    }
}
