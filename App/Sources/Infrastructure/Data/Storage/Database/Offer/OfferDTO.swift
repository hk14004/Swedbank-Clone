//
//  OfferDTO.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 26/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore
import SwedApplicationBusinessRules

public struct OfferDTO {
    public let id: String
    public let title: String?
    public let description: String?
    public let date: Date?
    
    init(
        id: String,
        title: String?,
        description: String?,
        date: Date?
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
    }
    
    init(offer: Offer) {
        self.id = offer.id
        self.title = offer.title
        self.description = offer.description
        self.date = offer.date
    }
    
}

extension OfferDTO: DBInterfaceDTO {
    public typealias StoreType = OfferCD
}

extension OfferDTO {
    func toOffer() -> Offer {
        Offer(
            id: id,
            title: title ?? "",
            description: description ?? "",
            date: date ?? Date()
        )
    }
}
