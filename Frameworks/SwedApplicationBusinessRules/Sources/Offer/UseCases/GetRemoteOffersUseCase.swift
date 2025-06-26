//
//  GetRemoteOffersUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol GetRemoteOffersUseCase {
    func use() -> AnyPublisher<[Offer], Never>
}

public struct DefaultLoadLatestOffersUseCase: GetRemoteOffersUseCase {
    private let offerRepository: OfferRepository
    
    public init(offerRepository: OfferRepository) {
        self.offerRepository = offerRepository
    }
    
    public func use() -> AnyPublisher<[Offer], Never> {
        offerRepository.getRemoteOffers()
    }
}
