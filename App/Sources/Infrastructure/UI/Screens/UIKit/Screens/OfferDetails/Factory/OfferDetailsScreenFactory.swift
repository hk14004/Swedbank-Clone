//
//  OfferDetailsScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import UIKit
import SwedInterfaceAdapters
import SwedApplicationBusinessRules

protocol OfferDetailsScreenFactory {
    func make(offer: OfferDTO) -> OfferDetailsScreenVC
}

class DefaultOfferDetailsScreenFactory: OfferDetailsScreenFactory {
    func make(offer: OfferDTO) -> OfferDetailsScreenVC {
        // Optionally get cached offer by id instead of passing around
        let vm = DefaultOfferDetailsScreenVM(offer: offer)
        let vc = OfferDetailsScreenVC(viewModel: vm)
        return vc
    }
}
