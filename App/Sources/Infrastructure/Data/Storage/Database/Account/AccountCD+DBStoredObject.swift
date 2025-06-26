//
//  AccountCD.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 1/05/2025.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore
import DevToolsCoreData
import SwedApplicationBusinessRules

extension AccountCD: DBStoredObject {
    
    public enum PersistedField: String, DBObjectField {
        case accountBalance
        case accType
        case availableFunds
        case creditLimit
        case currency
        case iban
        case ibanAlias
        case id
        case payable
        case reservedAmount
        case sortOrder
    }
    
    public func convert(fields: Set<PersistedField>) throws -> AccountDTO {
        func require(string: String?) throws -> String {
            guard let string = string else {
                throw NSError(domain: "PersistentStoreErrorDomain", code: 0)
            }
            return string
        }
        
        return AccountDTO(
            customerId: try require(string: id),
            accountBalance: (accountBalance ?? 0) as Money,
            availableFunds: (availableFunds ?? 0) as Money,
            creditLimit: (creditLimit ?? 0) as Money,
            currency: try require(string: currency),
            iban: try require(string: iban),
            ibanAlias: try require(string: ibanAlias),
            payable: payable,
            reservedAmount: (reservedAmount ?? 0) as Money,
            sortOrder: Int(sortOrder),
            accType: accType?.decodedAccType
        )
    }
    
    public func update(with model: AccountDTO, fields: Set<PersistedField>) {
        fields.forEach { field in
            switch field {
            case .accountBalance:
                accountBalance = (model.accountBalance ?? 0) as NSDecimalNumber
            case .availableFunds:
                availableFunds = (model.availableFunds ?? 0) as NSDecimalNumber
            case .creditLimit:
                creditLimit = (model.creditLimit ?? 0) as NSDecimalNumber
            case .currency:
                currency = model.currency
            case .iban:
                iban = model.iban
            case .ibanAlias:
                ibanAlias = model.ibanAlias
            case .id:
                id = model.customerId
            case .payable:
                payable = model.payable ?? false
            case .reservedAmount:
                reservedAmount = (model.reservedAmount ?? 0) as NSDecimalNumber
            case .sortOrder:
                sortOrder = Int64(model.sortOrder ?? 0)
            case .accType:
                accType = model.accType?.encoded
            }
        }
    }
}

fileprivate extension AccountType {
    var encoded: String {
        switch self {
        case .regular:
            return "REGULAR"
        case .savings:
            return "SAVINGS"
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
