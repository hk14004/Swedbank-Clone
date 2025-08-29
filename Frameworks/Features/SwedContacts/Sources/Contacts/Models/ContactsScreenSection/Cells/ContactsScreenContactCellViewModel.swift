//
//  ContactsScreenContactCellViewModel.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsUI
import DevToolsCore
import Foundation

struct ContactsScreenContactCellViewModel: DevTableSectionCellModel {
    public var contactID: String
    public var contactText: String
    public var contactDescription: String
    public var contactIcon: String
}

extension ContactsScreenContactCellViewModel {
    var contentHash: Int {
        var hasher = Hasher()
        hasher.combine(contactID)
        hasher.combine(contactText)
        hasher.combine(contactDescription)
        hasher.combine(contactIcon)
        return hasher.finalize()
    }
}

extension ContactsScreenContactCellViewModel {
    static func == (lhs: ContactsScreenContactCellViewModel, rhs: ContactsScreenContactCellViewModel) -> Bool {
        lhs.contactID == rhs.contactID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(contactID)
    }
}
