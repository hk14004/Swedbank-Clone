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

extension OfferCD: PersistedModel {

    public enum PersistedField: String, PersistedModelField {
        case date
        case description
        case title
        case id
    }

    public func toDomain(fields: Set<PersistedField>) throws -> OfferDTO {
            func require(_ field: PersistedField, _ value: String?, defaultValue: String = "") throws -> String {
                guard fields.contains(field) else { return defaultValue }
                guard let value = value else {
                    throw NSError(domain: "", code: 0)
                }
                return value
            }

            func requireDate(_ field: PersistedField, _ value: Date?, defaultValue: Date = Date()) throws -> Date {
                guard fields.contains(field) else { return Date.distantPast }
                guard let value = value else {
                    throw NSError(domain: "", code: 0)
                }
                return value
            }

            return OfferDTO(
                id: try require(.id, id),
                title: try require(.title, title),
                description: try require(.description, desc),
                date: try requireDate(.date, date)
            )
        }

        public func update(with model: OfferDTO, fields: Set<PersistedField>) {
            if fields.contains(.id) { self.id = model.id }
            if fields.contains(.title) { self.title = model.title }
            if fields.contains(.description) { self.desc = model.description }
            if fields.contains(.date) { self.date = model.date }
        }
}

extension OfferDTO: @retroactive PersistableDomainModel {
    public typealias StoreType = OfferCD
}
