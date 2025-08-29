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

public class ContactsScreenSection: DevTableSection {
    public enum SectionID: String, CaseIterable {
        case contactItems
    }
    
    public enum Cell: DevTableSectionCell {
        case contactItem(ContactsScreenContactCellViewModel)
    }
    
    public let id: SectionID
    public var title: String
    public var cells: [Cell]
    
    public init(id: SectionID, title: String = "", cells: [Cell]) {
        self.id = id
        self.title = title
        self.cells = cells
    }
}
