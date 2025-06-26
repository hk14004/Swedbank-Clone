//
//  AccountDTO.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 25/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore
import SwedApplicationBusinessRules

public struct AccountDTO {
    public let customerId: String
    public let accountBalance: Money?
    public let availableFunds: Money?
    public let creditLimit: Money?
    public let currency: String?
    public let iban: String?
    public let ibanAlias: String?
    public let payable: Bool?
    public let reservedAmount: Money?
    public let sortOrder: Int?
    
    init(
        customerId: String,
        accountBalance: Money?,
        availableFunds: Money?,
        creditLimit: Money?,
        currency: String?,
        iban: String?,
        ibanAlias: String?,
        payable: Bool?,
        reservedAmount: Money?,
        sortOrder: Int?
    ) {
        self.customerId = customerId
        self.accountBalance = accountBalance
        self.availableFunds = availableFunds
        self.creditLimit = creditLimit
        self.currency = currency
        self.iban = iban
        self.ibanAlias = ibanAlias
        self.payable = payable
        self.reservedAmount = reservedAmount
        self.sortOrder = sortOrder
    }
    
    init(account: Account) {
        self.customerId = account.customerId
        self.accountBalance = account.accountBalance
        self.availableFunds = account.availableFunds
        self.creditLimit = account.creditLimit
        self.currency = account.currency
        self.iban = account.iban
        self.ibanAlias = account.ibanAlias
        self.payable = account.payable
        self.reservedAmount = account.reservedAmount
        self.sortOrder = account.sortOrder
    }
    
}

extension AccountDTO: DBInterfaceDTO {
    public var id: String {
        customerId
    }
    
    public typealias StoreType = AccountCD
}

extension AccountDTO {
    func toAccount() throws -> Account {
        Account(
            customerId: customerId,
            accountBalance: accountBalance!,
            availableFunds: availableFunds!,
            creditLimit: creditLimit!,
            currency: currency!,
            iban: iban!,
            ibanAlias: ibanAlias!,
            payable: payable!,
            reservedAmount: reservedAmount!,
            sortOrder: sortOrder!
        )
    }
}
