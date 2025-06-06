//
//  DefaultFetchCustomersService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

extension DefaultFetchCustomersService {
    typealias FetchCustomersResponse = [CustomerResponseItem]
    
    struct CustomerResponseItem: Codable {
        public let id: String
        public let displayName: String
        public let type: String
        public let hasIpRestriction: Bool
        public let hasUsableAccounts: Bool
        public let sortOrder: Int
        public let roles: [String]
        public let authorities: [String]
        public let isMain: Bool
        
        func mapToDomain() throws -> CustomerDTO {
            CustomerDTO(
                id: id,
                displayName: displayName,
                type: makeCustomerType(stringValue: type),
                hasIpRestriction: hasIpRestriction,
                hasUsableAccounts: hasUsableAccounts,
                sortOrder: sortOrder,
                roles: roles.map { makeCustomerRole(stringValue: $0) },
                authorities: authorities.map { makeCustomerAuthority(stringValue: $0) },
                isMain: isMain
            )
        }
    }
}

fileprivate func makeCustomerType(stringValue: String) -> CustomerType {
    switch stringValue {
    case "PRIVATE":
        return .private
    case "BUSINESS":
        return .business
    case "CHILD":
        return .child
    default:
        return .private
    }
}

fileprivate func makeCustomerRole(stringValue: String) -> CustomerRole {
    switch stringValue {
    case "PRIVATE":
        return .private
    case "BUSINESS":
        return .business
    case "PARENT":
        return .parent
    default:
        return .private
    }
}

fileprivate func makeCustomerAuthority(stringValue: String) -> CustomerAuthority {
    switch stringValue {
    case "CARDS":
        return .cards
    case "PAYMENTS":
        return .payments
    case "STATEMENTS":
        return .statements
    default:
        return .cards
    }
}
