//
//  CustomerConverter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsPersistance
import Application

struct CustomerConverter: DevModelConverter {
    func persistableObject(from domainModel: Customer) throws -> CustomerSD {
        CustomerSD(
            id: domainModel.id,
            displayName: domainModel.displayName,
            type: domainModel.type,
            hasIpRestriction: domainModel.hasIpRestriction,
            hasUsableAccounts: domainModel.hasUsableAccounts,
            sortOrder: domainModel.sortOrder,
            roles: domainModel.roles,
            authorities: domainModel.authorities,
            isMain: domainModel.isMain
        )
    }
    
    func domainObject(from persistedModel: CustomerSD) throws -> Customer {
        Customer(
            id: persistedModel.id,
            displayName: persistedModel.displayName,
            type: persistedModel.type,
            hasIpRestriction: persistedModel.hasIpRestriction,
            hasUsableAccounts: persistedModel.hasUsableAccounts,
            sortOrder: persistedModel.sortOrder,
            roles: persistedModel.roles,
            authorities: persistedModel.authorities,
            isMain: persistedModel.isMain
        )
    }
    
    func updatePersistedObject(with domainModel: Customer, object: CustomerSD) throws {
        object.id = domainModel.id
        object.displayName = domainModel.displayName
        object.type = domainModel.type
        object.hasIpRestriction = domainModel.hasIpRestriction
        object.hasUsableAccounts = domainModel.hasUsableAccounts
        object.sortOrder = domainModel.sortOrder
        object.roles = domainModel.roles
        object.authorities = domainModel.authorities
        object.isMain = domainModel.isMain
    }
}
