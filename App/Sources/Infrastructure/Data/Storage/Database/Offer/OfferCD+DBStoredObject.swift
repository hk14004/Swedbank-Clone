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
        case description
        case title
        case id
    }
    
    public func convert(fields: Set<PersistedField>) throws -> OfferDTO {
        func require(string: String?) throws -> String {
            guard let string = string else {
                throw NSError(domain: "PersistentStoreErrorDomain", code: 0)
            }
            return string
        }
        
        return OfferDTO(
            id: try require(string: id),
            title: title ?? "Default Title",
            description: desc ?? "Default Description",
            date: date ?? Date()
        )
    }
    
    public func update(with model: OfferDTO, fields: Set<PersistedField>) {
        if fields.contains(.id) { self.id = model.id }
        if fields.contains(.title) { self.title = model.title }
        if fields.contains(.description) { self.desc = model.description }
        if fields.contains(.date) { self.date = model.date }
    }
}
