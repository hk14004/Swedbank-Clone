//
//  AccountConverter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsPersistance
import Application
import DevToolsCore

struct AccountConverter: DevModelConverter {
    func persistableObject(from domainModel: Account) throws -> AccountSD {
        AccountSD(
            id: domainModel.id,
            customerId: domainModel.customerId,
            accountBalance: domainModel.accountBalance,
            availableFunds: domainModel.availableFunds,
            creditLimit: domainModel.creditLimit,
            currency: domainModel.currency,
            iban: domainModel.iban,
            ibanAlias: domainModel.ibanAlias,
            payable: domainModel.payable,
            reservedAmount: domainModel.reservedAmount,
            sortOrder: domainModel.sortOrder,
            accType: domainModel.accType
        )
    }
    
    func domainObject(from persistedModel: AccountSD) throws -> Account {
        Account(
            customerId: persistedModel.id,
            accountBalance: persistedModel.accountBalance,
            availableFunds: persistedModel.availableFunds,
            creditLimit: persistedModel.creditLimit,
            currency: persistedModel.currency,
            iban: persistedModel.iban,
            ibanAlias: persistedModel.ibanAlias,
            payable: persistedModel.payable,
            reservedAmount: persistedModel.reservedAmount,
            sortOrder: persistedModel.sortOrder,
            accType: persistedModel.accType
        )
    }
    
    func updatePersistedObject(with domainModel: Account, object: AccountSD) throws {
        object.id = domainModel.id
        object.customerId = domainModel.customerId
        object.accountBalance = domainModel.accountBalance
        object.availableFunds = domainModel.availableFunds
        object.creditLimit = domainModel.creditLimit
        object.currency = domainModel.currency
        object.iban = domainModel.iban
        object.ibanAlias = domainModel.ibanAlias
        object.payable = domainModel.payable
        object.reservedAmount = domainModel.reservedAmount
        object.sortOrder = domainModel.sortOrder
        object.accType = domainModel.accType
    }
}
