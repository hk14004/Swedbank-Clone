//
//  CustomerConverter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsPersistance
import SwedApplicationBusinessRules

struct CustomerConverter: DevModelConverter {
    func domainObject(from persistedModel: CustomerCD) throws -> Customer {
        Customer(
            id: persistedModel.id ?? "",
            displayName: persistedModel.displayName ?? "",
            type: .private,
            hasIpRestriction: persistedModel.hasIpRestriction,
            hasUsableAccounts: persistedModel.hasUsableAccounts,
            sortOrder: 0,
            roles: [],
            authorities: [],
            isMain: persistedModel.isMain
        )
    }
    
    func updatePersistedObject(with domainModel: Customer, object: CustomerCD) throws {
        fatalError()
    }
}
