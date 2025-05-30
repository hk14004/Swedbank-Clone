//
//  OverviewScreenOfferCellViewModel.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsUI
import DevToolsCore
import Foundation
import SwedApplicationBusinessRules

public struct OverviewScreenOfferCellViewModel: DevTableSectionCellModel {
    public var offerID: String
    public var offerText: String
    public var offerUrl: String
    public var didTap: (() -> Void)?
    
    public init(offer: OfferDTO, didTap: (() -> Void)?) {
        self.offerID = offer.id
        self.offerText = offer.title + " " + offer.description
        self.offerUrl = ""
        self.didTap = didTap
    }
}

public extension OverviewScreenOfferCellViewModel {
    var contentHash: Int {
        var hasher = Hasher()
        hasher.combine(offerID)
        hasher.combine(offerText)
        hasher.combine(offerUrl)
        return hasher.finalize()
    }
}

public extension OverviewScreenOfferCellViewModel {
    static func == (lhs: OverviewScreenOfferCellViewModel, rhs: OverviewScreenOfferCellViewModel) -> Bool {
        lhs.offerID == rhs.offerID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(offerID)
    }
}
