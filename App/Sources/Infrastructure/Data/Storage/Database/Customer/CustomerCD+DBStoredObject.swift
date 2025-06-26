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
    
    public func convert(fields: Set<PersistedField>) throws -> CustomerDTO {
        CustomerDTO(
            id: id ?? "",
            displayName: displayName ?? "",
            type: type?.decodedCustomerType(),
            hasIpRestriction: hasIpRestriction,
            hasUsableAccounts: hasUsableAccounts,
            sortOrder: Int(sortOrder),
            roles: roles?.decodedCustomerRoles,
            authorities: authorities?.decodedCustomerAuthorities,
            isMain: isMain
        )
    }
    
    public func update(with model: CustomerDTO, fields: Set<PersistedField>) {
        fields.forEach { field in
            switch field {
            case .isMain:
                self.isMain = model.isMain ?? false
            case .displayName:
                self.displayName = model.displayName
            case .hasIpRestriction:
                self.hasIpRestriction = model.hasIpRestriction ?? false
            case .hasUsableAccounts:
                self.hasUsableAccounts = model.hasUsableAccounts ?? false
            case .sortOrder:
                self.sortOrder = Int64(model.sortOrder ?? 0)
            case .id:
                self.id = model.id
            case .authorities:
                self.authorities = model.authorities?.encoded
            case .roles:
                self.roles = model.roles?.encoded
            case .type:
                self.type = model.type?.encoded
            }
        }
    }
}

fileprivate extension CustomerType {
    var encoded: String {
        switch self {
        case .private:
            "private"
        case .business:
            "business"
        case .child:
            "child"
        }
    }
}

fileprivate extension String {
    func decodedCustomerType() -> CustomerType? {
        switch self {
        case "private":
            return .private
        case "business":
            return .business
        case "child":
            return .child
        default:
            return .none
        }
    }
}

fileprivate extension Data {
    var decodedCustomerRoles: [CustomerRole]? {
        try? JSONDecoder().decode([CustomerRole].self, from: self)
    }
}

fileprivate extension Array where Element == CustomerRole {
    var encoded: Data? {
        try? JSONEncoder().encode(self)
    }
}

fileprivate extension Data {
    var decodedCustomerAuthorities: [CustomerAuthority]? {
        try? JSONDecoder().decode([CustomerAuthority].self, from: self)
    }
}

fileprivate extension Array where Element == CustomerAuthority {
    var encoded: Data? {
        try? JSONEncoder().encode(self)
    }
}
