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

extension CustomerCD: PersistedModel {
    
    public enum PersistedField: String, PersistedModelField {
        case isMain
        case displayName
        case hasIpRestriction
        case hasUsableAccounts
        case sortOrder
        case id
    }
    
    public func toDomain(fields: Set<PersistedField>) throws -> CustomerDTO {
        return CustomerDTO(
            id: id ?? "",
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
        if fields.contains(.id) { self.id = model.id }
        if fields.contains(.sortOrder) { self.sortOrder = Int64(model.sortOrder) }
        if fields.contains(.hasUsableAccounts) { self.hasUsableAccounts = model.hasUsableAccounts }
        if fields.contains(.hasIpRestriction) { self.hasIpRestriction = model.hasIpRestriction }
        if fields.contains(.displayName) { self.displayName = model.displayName }
        if fields.contains(.isMain) { self.isMain = model.isMain }
    }
}

extension CustomerDTO: @retroactive PersistableDomainModel {
    public typealias StoreType = CustomerCD
}
