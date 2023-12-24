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
        case cardBalance(CellViewModel)
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

public class CellViewModel {
    public let id: String
    public let title: String
    public let text: String
    
    public init(id: String, title: String, text: String) {
        self.id = id
        self.title = title
        self.text = text
    }
}

extension CellViewModel: DevContentComparable {
    public var contentHash: Int {
        var hasher = Hasher()
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(text)
        return hasher.finalize()
    }
}

extension CellViewModel: Hashable {
    public static func == (lhs: CellViewModel, rhs: CellViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
