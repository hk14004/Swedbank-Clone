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

public protocol LoadLatestOffersUseCase {
    func use() -> AnyPublisher<[OfferDTO], Never>
}

public struct DefaultLoadLatestOffersUseCase: LoadLatestOffersUseCase {
    private let offerRepository: OfferRepository
    private let fetchRemoteOffersService: FetchRemoteOffersService
    
    public init(
        offerRepository: OfferRepository,
        fetchRemoteOffersService: FetchRemoteOffersService
    ) {
        self.offerRepository = offerRepository
        self.fetchRemoteOffersService = fetchRemoteOffersService
    }
    
    public func use() -> AnyPublisher<[OfferDTO], Never> {
        fetchRemoteOffersService.use()
            .flatMap { offers in
                offerRepository.replace(with: offers)
                    .flatMap { _ -> AnyPublisher<[OfferDTO], Never> in
                            .just(offers)
                    }
            }
            .eraseToAnyPublisher()
    }
}
