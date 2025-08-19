//
//  OfferRepository.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import Enterprise
import Foundation

public protocol OfferRepository {
    func replace(with items: [Offer]) -> AnyPublisher<Void, Never>
    func getRemoteOffers() -> AnyPublisher<[Offer], Error>
    func observeCachedList() -> AnyPublisher<[Offer], Never>
}
