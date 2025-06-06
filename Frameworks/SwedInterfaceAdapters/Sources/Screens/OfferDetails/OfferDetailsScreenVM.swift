//
//  OfferDetailsScreenVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplicationBusinessRules

public protocol OfferDetailsScreenVMOutput {
    var title: String { get }
    var description: String { get }
}

public protocol OfferDetailsScreenVM: ObservableObject, OfferDetailsScreenVMOutput {}

public class DefaultOfferDetailsScreenVM: OfferDetailsScreenVM {
    // MARK: Properties
    private let offer: OfferDTO
    public var title: String { offer.title }
    public var description: String { offer.description }
    
    // MARK: Lifecycle
    public init(offer: OfferDTO) {
        self.offer = offer
    }
}
