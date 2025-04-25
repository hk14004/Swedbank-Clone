//
//  ProfileScreenSection.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsUI

public class ProfileScreenSection: DevTableSection {
    public enum SectionID: String, CaseIterable {
        case privatePerson
        case settings
        case privacy
    }
    
    public enum Cell: DevTableSectionCell {
        case navigation(NavigationItem)
        case logout
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
