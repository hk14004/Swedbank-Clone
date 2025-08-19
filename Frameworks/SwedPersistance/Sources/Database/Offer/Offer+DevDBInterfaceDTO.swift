//
//  Offer+DBInterfaceDTO.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 26/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import SwedApplication
import DevToolsPersistance

extension Offer: @retroactive DevDBInterfaceDTO {
    public typealias StoreType = OfferSD
}
