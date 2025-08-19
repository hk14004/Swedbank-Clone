//
//  CustomerSD.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 1/05/2025.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwiftData
import DevToolsPersistance
import Application

@Model
public class CustomerSD {
    @Attribute(.unique) public var id: String
    public var displayName: String
    public var type: CustomerType
    public var hasIpRestriction: Bool
    public var hasUsableAccounts: Bool
    public var sortOrder: Int
    public var roles: [CustomerRole]
    public var authorities: [CustomerAuthority]
    public var isMain: Bool
    
    init(
        id: String,
        displayName: String,
        type: CustomerType,
        hasIpRestriction: Bool,
        hasUsableAccounts: Bool,
        sortOrder: Int,
        roles: [CustomerRole],
        authorities: [CustomerAuthority],
        isMain: Bool
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
}

extension CustomerSD: DevDBStoredObject {}
