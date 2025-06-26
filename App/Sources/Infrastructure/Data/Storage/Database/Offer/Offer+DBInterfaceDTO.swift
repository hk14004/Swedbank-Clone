//
//  Offer+DBInterfaceDTO.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 26/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules
import DevToolsCore

extension Offer: @retroactive DBInterfaceDTO {
    public typealias StoreType = OfferCD
}
