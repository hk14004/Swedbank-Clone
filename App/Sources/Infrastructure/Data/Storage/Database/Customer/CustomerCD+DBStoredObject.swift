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
        case authorities
        case displayName
        case hasIpRestriction
        case hasUsableAccounts
        case id
        case isMain
        case roles
        case sortOrder
        case type
    }
    
    public func convert(fields: Set<PersistedField>) throws -> Customer {
        Customer(
            id: id ?? "",
            displayName: displayName ?? "",
            type: CustomerType.init(rawValue: type ?? "") ?? .private,
            hasIpRestriction: hasIpRestriction,
            hasUsableAccounts: hasUsableAccounts,
            sortOrder: Int(sortOrder),
            roles:  (try? JSONDecoder().decode([CustomerRole].self, from: roles ?? Data())) ?? [],
            authorities: (try? JSONDecoder().decode([CustomerAuthority].self, from: authorities ?? Data())) ?? [],
            isMain: isMain
        )
    }
    
    public func update(with model: Customer, fields: Set<PersistedField>) {
        fields.forEach { field in
            switch field {
            case .isMain:
                isMain = model.isMain
            case .displayName:
                displayName = model.displayName
            case .hasIpRestriction:
                hasIpRestriction = model.hasIpRestriction
            case .hasUsableAccounts:
                hasUsableAccounts = model.hasUsableAccounts
            case .sortOrder:
                sortOrder = Int64(model.sortOrder)
            case .id:
                id = model.id
            case .authorities:
                authorities = try? JSONEncoder().encode(model.authorities)
            case .roles:
                roles = try? JSONEncoder().encode(model.roles)
            case .type:
                type = model.type.rawValue
            }
        }
    }
}
