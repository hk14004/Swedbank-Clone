//
//  CustomerDTO.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 25/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules
import DevToolsCore

public struct CustomerDTO {
    public let id: String
    public let displayName: String?
    public let type: CustomerType?
    public let hasIpRestriction: Bool?
    public let hasUsableAccounts: Bool?
    public let sortOrder: Int?
    public let roles: [CustomerRole]?
    public let authorities: [CustomerAuthority]?
    public let isMain: Bool?
    
    public init(
        id: String,
        displayName: String?,
        type: CustomerType?,
        hasIpRestriction: Bool?,
        hasUsableAccounts: Bool?,
        sortOrder: Int?,
        roles: [CustomerRole]?,
        authorities: [CustomerAuthority]?,
        isMain: Bool?
    ) {
        self.id = id
        self.displayName = displayName
        self.type = type
        self.hasIpRestriction = hasIpRestriction
        self.hasUsableAccounts = hasUsableAccounts
        self.sortOrder = sortOrder
        self.roles = roles
        self.authorities = authorities
        self.isMain = isMain
    }
    
    public init (
        customer: Customer
    ) throws {
        self.id = customer.id
        self.displayName = customer.displayName
        self.type = customer.type
        self.hasIpRestriction = customer.hasIpRestriction
        self.hasUsableAccounts = customer.hasUsableAccounts
        self.sortOrder = customer.sortOrder
        self.roles = customer.roles
        self.authorities = customer.authorities
        self.isMain = customer.isMain
    }
}

extension CustomerDTO: DBInterfaceDTO {
    public typealias StoreType = CustomerCD
}


extension CustomerDTO {
    func toCustomer() throws -> Customer {
        Customer(
            id: id,
            displayName: displayName ?? "",
            type: type ?? .private,
            hasIpRestriction: hasIpRestriction ?? false,
            hasUsableAccounts: hasUsableAccounts ?? false,
            sortOrder: sortOrder ?? 0,
            roles: roles ?? [],
            authorities: authorities ?? [],
            isMain: isMain ?? false
        )
    }
}
