//
//  OfferDetailsScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import UIKit
import SwedApplication

public protocol OfferDetailsScreenFactory {
    func make(offer: Offer) -> OfferDetailsScreenVC
}

public class DefaultOfferDetailsScreenFactory: OfferDetailsScreenFactory {
    
    public init() {}
    
    public func make(offer: Offer) -> OfferDetailsScreenVC {
        // Optionally get cached offer by id instead of passing around
        let vm = DefaultOfferDetailsScreenVM(offer: offer)
        let vc = OfferDetailsScreenVC(viewModel: vm)
        return vc
    }
}
