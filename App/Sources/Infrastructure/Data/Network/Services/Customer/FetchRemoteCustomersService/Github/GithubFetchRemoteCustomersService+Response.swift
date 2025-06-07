//
//  DefaultFetchCustomersService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

extension GithubFetchRemoteCustomersService {
    typealias Response = [CustomerData]
    
    struct CustomerData: Codable {
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
                type: try decodeCustomerType(stringValue: type),
                hasIpRestriction: hasIpRestriction,
                hasUsableAccounts: hasUsableAccounts,
                sortOrder: sortOrder,
                roles: try decodeCustomerRoles(roles: roles),
                authorities: try decodeCustomerAuthority(authorities: authorities),
                isMain: isMain
            )
        }
    }
}

fileprivate func decodeCustomerType(stringValue: String) throws -> CustomerType {
    switch stringValue {
    case "PRIVATE":
        return .private
    case "BUSINESS":
        return .business
    case "CHILD":
        return .child
    default:
        throw DecodingError.dataCorrupted(
            DecodingError.Context(
                codingPath: [],
                debugDescription: "Unsupported customer type \(stringValue)"
            )
        )
    }
}

fileprivate func decodeCustomerRoles(roles: [String]) throws -> [CustomerRole] {
    try roles.map {
        switch $0 {
        case "PRIVATE":
            return .private
        case "BUSINESS":
            return .business
        case "PARENT":
            return .parent
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: [],
                    debugDescription: "Unsupported customer role \($0)"
                )
            )
        }
    }
}

fileprivate func decodeCustomerAuthority(authorities: [String]) throws -> [CustomerAuthority] {
    try authorities.map {
        switch $0 {
        case "CARDS":
            return .cards
        case "PAYMENTS":
            return .payments
        case "STATEMENTS":
            return .statements
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: [],
                    debugDescription: "Unsupported customer role \($0)"
                )
            )
        }
    }
}
