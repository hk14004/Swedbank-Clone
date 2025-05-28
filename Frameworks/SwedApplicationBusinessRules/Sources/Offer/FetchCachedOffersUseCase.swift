//
//  GetOffersUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import SwedEnterpriseBusinessRules

public protocol FetchCachedOffersUseCase {
    func use() -> AnyPublisher<[OfferDTO], Never>
}

public struct DefaultFetchCachedOffersUseCase: FetchCachedOffersUseCase {
    private let offerRepository: OfferRepository
    
    public init(offerRepository: OfferRepository) {
        self.offerRepository = offerRepository
    }
    
    public func use() -> AnyPublisher<[OfferDTO], Never> {
        offerRepository.getList(predicate: NSPredicate(value: true))
    }
}
