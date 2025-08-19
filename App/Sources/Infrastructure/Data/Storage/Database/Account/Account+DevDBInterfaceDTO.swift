//
//  Account+DBInterfaceDTO.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 26/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Application
import DevToolsPersistance

extension Account: @retroactive DevDBInterfaceDTO {
    public typealias StoreType = AccountSD
    
    public var id: String {
        iban
    }
}
