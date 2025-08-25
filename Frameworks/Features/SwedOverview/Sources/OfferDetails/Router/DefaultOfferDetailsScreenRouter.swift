//
//  DefaultOfferDetailsScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import DevToolsNavigation
import SwedApplication


public protocol HasOfferDetailsScreenFactory {
    var offerDetailsScreenFactory: OfferDetailsScreenFactory { get }
}

extension ToOfferDetailsRouting where Self: UIKitRouter & HasOfferDetailsScreenFactory {
    func routeToOfferDetails(offer: Offer) {
        let vc = offerDetailsScreenFactory.make(offer: offer)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
