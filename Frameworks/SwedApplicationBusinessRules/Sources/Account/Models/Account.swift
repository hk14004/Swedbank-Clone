//
//  Account.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 06/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//
import DevToolsCore

public struct Account {
    public let customerId: String
    public let accountBalance: Money
    public let availableFunds: Money
    public let creditLimit: Money
    public let currency: String
    public let iban: String
    public let ibanAlias: String
    public let payable: Bool
    public let reservedAmount: Money
    public let sortOrder: Int
    public let accType: AccountType
    
    public init(
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

public enum AccountType: String, Codable {
    case regular
    case savings
}
