//
//  OfferConverter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsPersistance
import SwedApplicationBusinessRules

struct OfferConverter: DevModelConverter {
    func domainObject(from persistedModel: OfferCD) throws -> Offer {
        Offer(
            id: persistedModel.id ?? "",
            title: persistedModel.title ?? "",
            description: persistedModel.desc ?? "",
            date: persistedModel.date ?? Date()
        )
    }
    
    func updatePersistedObject(with domainModel: Offer, object: OfferCD) throws {
        object.id = domainModel.id
        object.title = domainModel.title
        object.desc = domainModel.description
        object.date = domainModel.date
    }
}
