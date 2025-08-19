//
//  DefaultOfferDetailsScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import DevToolsNavigation
import Application

extension ToOfferDetailsRouting where Self: UIKitRouter {
    func routeToOfferDetails(offer: Offer) {
        let factory: OfferDetailsScreenFactory = Composition.resolve()
        let vc = factory.make(offer: offer)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
