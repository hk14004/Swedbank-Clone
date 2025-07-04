//
//  AccountConverter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsPersistance
import SwedApplicationBusinessRules
import DevToolsCore


struct AccountConverter: DevModelConverter {
    func domainObject(from persistedModel: AccountCD) throws -> Account {
        Account(
            customerId: persistedModel.id ?? "",
            accountBalance: (persistedModel.accountBalance ?? 0) as Money,
            availableFunds: (persistedModel.availableFunds ?? 0) as Money,
            creditLimit: (persistedModel.creditLimit ?? 0) as Money,
            currency: persistedModel.currency ?? "",
            iban: persistedModel.iban ?? "",
            ibanAlias: persistedModel.ibanAlias ?? "",
            payable: persistedModel.payable,
            reservedAmount: (persistedModel.reservedAmount ?? 0) as Money,
            sortOrder: 0,
            accType: .regular
        )
    }
    
    func updatePersistedObject(with domainModel: Account, object: AccountCD) throws {
        object.id = domainModel.customerId
        object.accountBalance = domainModel.accountBalance as NSDecimalNumber
        object.availableFunds = domainModel.availableFunds as NSDecimalNumber
        object.creditLimit = domainModel.creditLimit as NSDecimalNumber
        object.currency = domainModel.currency
        object.iban = domainModel.iban
        object.ibanAlias = domainModel.ibanAlias
        object.payable = domainModel.payable
        object.reservedAmount = domainModel.reservedAmount as NSDecimalNumber
    }
}
