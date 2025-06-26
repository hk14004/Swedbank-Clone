//
//  OfferCD.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 1/05/2025.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore
import DevToolsCoreData
import SwedApplicationBusinessRules

extension OfferCD: DBStoredObject {
    
    public enum PersistedField: String, DBObjectField {
        case date
        case desc
        case id
        case title
    }
    
    public func convert(fields: Set<PersistedField>) throws -> Offer {
        Offer(
            id: id ?? "",
            title: title ?? "",
            description: desc ?? "",
            date: date ?? Date()
        )
    }
    
    public func update(with model: Offer, fields: Set<PersistedField>) {
        fields.forEach { field in
            switch field {
            case .date:
                date = model.date
            case .desc:
                desc = model.description
            case .id:
                id = model.id
            case .title:
                title = model.title
            }
        }
    }
}
