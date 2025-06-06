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

extension AccountCD: PersistedModel {
    
    public enum PersistedField: String, PersistedModelField {
        case customerId
    }
    
    public func toDomain(fields: Set<PersistedField>) throws -> AccountDTO {
        AccountDTO(
            customerId: id ?? "",
            accountBalance: 0,
            availableFunds: (availableFunds ?? 0) as Money,
            creditLimit: 0,
            currency: currency ?? "",
            iban: iban ?? "",
            ibanAlias: ibanAlias ?? "",
            payable: payable,
            reservedAmount: 0,
            sortOrder: 0
        )
    }
    
    public func update(with model: AccountDTO, fields: Set<PersistedField>) {
        id = model.customerId
        accountBalance = model.accountBalance as NSDecimalNumber
        availableFunds = model.availableFunds as NSDecimalNumber
        creditLimit = model.creditLimit as NSDecimalNumber
        currency = model.currency
        iban = model.iban
        ibanAlias = model.ibanAlias
        payable = model.payable
        reservedAmount = model.reservedAmount as NSDecimalNumber
        sortOrder = Int64(model.sortOrder)
    }
}

extension AccountDTO: @retroactive PersistableDomainModel {
    public var id: String {
        customerId
    }
    
    public typealias StoreType = AccountCD
}
