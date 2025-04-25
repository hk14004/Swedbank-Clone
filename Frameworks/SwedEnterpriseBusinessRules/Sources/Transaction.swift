//
//  Transaction.swift
//  SwedEnterpriseBusinessRules
//
//  Created by Hardijs Ķirsis on 21/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore

public struct Transaction {
    public let id: String
    let date: Date
    let description: String
    let amount: Money
    let type: TransactionType
    let counterPartyAccount: String
    let counterPartyName: String
}

extension Transaction: Equatable, Hashable {}

extension Transaction {
    enum TransactionType: String {
        case debit
        case credit
    }
}
