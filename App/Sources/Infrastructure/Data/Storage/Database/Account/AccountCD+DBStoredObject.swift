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
        case customerId
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
            sortOrder: Int(sortOrder)
        )
    }
    
    // TODO: Add optional handling
    public func update(with model: AccountDTO, fields: Set<PersistedField>) {
        id = model.customerId
        accountBalance = (model.accountBalance ?? 0) as NSDecimalNumber
        availableFunds = (model.availableFunds ?? 0) as NSDecimalNumber
        creditLimit = (model.creditLimit ?? 0) as NSDecimalNumber
        currency = model.currency
        iban = model.iban
        ibanAlias = model.ibanAlias
        payable = model.payable ?? false
        reservedAmount = (model.reservedAmount ?? 0) as NSDecimalNumber
        sortOrder = Int64(model.sortOrder ?? 0)
    }
}
