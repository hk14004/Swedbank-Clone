//
//  GithubFetchRemoteCustomersService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication

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
        
        func mapToDomain() throws -> Customer {
            Customer(
                id: id,
                displayName: displayName,
                type: CustomerType(rawValue: type.lowercased()) ?? .private,
                hasIpRestriction: hasIpRestriction,
                hasUsableAccounts: hasUsableAccounts,
                sortOrder: sortOrder,
                roles: roles.compactMap { CustomerRole(rawValue: $0.lowercased()) },
                authorities: roles.compactMap { CustomerAuthority(rawValue: $0.lowercased()) },
                isMain: isMain
            )
        }
    }
}
