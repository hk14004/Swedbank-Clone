//
//  ContactsScreenSection.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsUI
import DevToolsCore

class ContactsScreenSection: DevTableSection {
    enum SectionID: String, CaseIterable {
        case contactItems
    }
    
    enum Cell: DevTableSectionCell {
        case contactItem(ContactsScreenContactCellViewModel)
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
