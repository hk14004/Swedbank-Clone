//
//  ProfileScreenSection.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsUI

class ProfileScreenSection: DevTableSection {
    enum SectionID: String, CaseIterable {
        case privatePerson
        case settings
        case privacy
    }
    
    enum Cell: DevTableSectionCell {
        case navigation(NavigationItem)
        case logout
    }
    
    let id: SectionID
    var title: String
    var cells: [Cell]
    
    init(id: SectionID, title: String, cells: [Cell]) {
        self.id = id
        self.title = title
        self.cells = cells
    }
}
