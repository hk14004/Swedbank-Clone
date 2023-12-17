//
//  OverviewScreenSection.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsUI

public class OverviewScreenSection: DevTableSection {
    public enum Identifier: String, CaseIterable {
        case overview
    }
    
    public enum Cell: Hashable {
        case cardBalance
        case offer
        case expenses
    }
    
    public let identifier: Identifier
    public var title: String
    public var cells: [Cell]
    
    public init(identifier: Identifier, title: String, cells: [Cell]) {
        self.identifier = identifier
        self.title = title
        self.cells = cells
    }
}
