//
//  AccountSD.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 1/05/2025.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwiftData
import DevToolsPersistance
import Application
import DevToolsCore

@Model
public class AccountSD {
    @Attribute(.unique) public var id: String
    public var customerId: String
    public var accountBalance: Money
    public var availableFunds: Money
    public var creditLimit: Money
    public var currency: String
    public var iban: String
    public var ibanAlias: String
    public var payable: Bool
    public var reservedAmount: Money
    public var sortOrder: Int
    public var accType: AccountType
    
    init(
        id: String,
        customerId: String,
        accountBalance: Money,
        availableFunds: Money,
        creditLimit: Money,
        currency: String,
        iban: String,
        ibanAlias: String,
        payable: Bool,
        reservedAmount: Money,
        sortOrder: Int,
        accType: AccountType
    ) {
        self.id = id
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
        self.accType = accType
    }

}

extension AccountSD: DevDBStoredObject {}
