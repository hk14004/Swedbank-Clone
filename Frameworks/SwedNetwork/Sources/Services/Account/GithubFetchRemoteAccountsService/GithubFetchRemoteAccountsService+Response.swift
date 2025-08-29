//
//  GithubFetchRemoteAccountsService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 06/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplication
import DevToolsCore

extension GithubFetchRemoteAccountsService {
    typealias GithubAccountsResponse = [GithubAccount]
    
    struct GithubAccount: Codable {
        let customerId: String?
        let iban: String?
        let availableFunds: Decimal?
        let currency: String?
        let ibanAlias: String?
        let sortOrder: Int?
        let payable: Bool?
        let accType: String?
        let accSubType: String?
        let accountBalance: Decimal?
        let reservedAmount: Decimal?
        let creditLimit: Decimal?
        
        // Optionaly handle missing data or provide defaults, throw error
        func mapToDomain() throws -> Account {
            Account(
                customerId: customerId ?? "",
                accountBalance: accountBalance ?? 0,
                availableFunds: availableFunds ?? 0,
                creditLimit: creditLimit ?? 0,
                currency: currency ?? "",
                iban: iban ?? "",
                ibanAlias: ibanAlias ?? "",
                payable: payable ?? false,
                reservedAmount: reservedAmount ?? 0,
                sortOrder: sortOrder ?? 0,
                accType: accType?.decodedAccType ?? .regular
            )
        }
    }
    
}

fileprivate extension String {
    var decodedAccType: AccountType? {
        switch self {
        case "SAVINGS":
                .savings
        case "REGULAR":
                .regular
        default:
            nil
        }
    }
}
