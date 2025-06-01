//
//  OfferDetailsScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import DevToolsNavigation
import SwedInterfaceAdapters
import SwedApplicationBusinessRules

public protocol OfferDetailsScreenRouter {}

extension ToOfferDetailsRouting where Self: UIKitRouter {
    func routeToOfferDetails(offer: OfferDTO) {
        let factory: OfferDetailsScreenFactory = Composition.resolve()
        let vc = factory.make(offer: offer)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
