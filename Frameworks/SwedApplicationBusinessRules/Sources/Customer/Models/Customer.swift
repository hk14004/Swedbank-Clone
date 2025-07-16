//
//  CustomerDTO.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public struct Customer {
    public let id: String
    public let displayName: String
    public let type: CustomerType
    public let hasIpRestriction: Bool
    public let hasUsableAccounts: Bool
    public let sortOrder: Int
    public let roles: [CustomerRole]
    public let authorities: [CustomerAuthority]
    public let isMain: Bool
    
    public init(
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

public extension Customer {
    func getInitials() -> String {
        let words = displayName.split(separator: " ")
        return words.map { $0.first?.uppercased() ?? "" }.joined()
    }
}

public enum CustomerType: String, Codable {
    case `private`
    case business
    case child
}

public enum CustomerRole: String, Codable {
    case `private`
    case business
    case parent
}

public enum CustomerAuthority: String, Codable {
    case cards
    case payments
    case statements
}
