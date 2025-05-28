//
//  OfferDTO.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation

public struct OfferDTO: Codable {
    public let id: String
    public let title: String
    public let description: String
    public let date: Date
    
    public init(id: String, title: String, description: String, date: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
    }
}

extension OfferDTO: Equatable, Hashable {}
