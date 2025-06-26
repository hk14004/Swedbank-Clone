//
//  CustomerCD.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 1/05/2025.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore
import DevToolsCoreData
import SwedApplicationBusinessRules

extension CustomerCD: DBStoredObject {
    
    public enum PersistedField: String, DBObjectField {
        case isMain
        case displayName
        case hasIpRestriction
        case hasUsableAccounts
        case sortOrder
        case id
    }
    
    // TODO: Persist transformables
    public func convert(fields: Set<PersistedField>) throws -> CustomerDTO {
        func require(string: String?) throws -> String {
            guard let string = string else {
                throw NSError(domain: "PersistentStoreErrorDomain", code: 0)
            }
            return string
        }
        
        return CustomerDTO(
            id: try require(string: id),
            displayName: displayName ?? "",
            type: .private,
            hasIpRestriction: hasIpRestriction,
            hasUsableAccounts: hasUsableAccounts,
            sortOrder: Int(sortOrder),
            roles: [],
            authorities: [],
            isMain: isMain
        )
    }
    
    public func update(with model: CustomerDTO, fields: Set<PersistedField>) {
        // switch fields
        if fields.contains(.id) { self.id = model.id }
        if fields.contains(.sortOrder) { self.sortOrder = Int64(model.sortOrder ?? 0) }
        if fields.contains(.hasUsableAccounts) { self.hasUsableAccounts = model.hasUsableAccounts ?? false }
        if fields.contains(.hasIpRestriction) { self.hasIpRestriction = model.hasIpRestriction ?? false }
        if fields.contains(.displayName) { self.displayName = model.displayName }
        if fields.contains(.isMain) { self.isMain = model.isMain ?? false }
    }
}
