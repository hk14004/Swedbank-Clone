//
//  OfferRepository.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedEnterpriseBusinessRules
import Foundation

public protocol OfferRepository {
    func replace(with items: [OfferDTO]) -> AnyPublisher<Void, Never>
    func getRemoteOffers() -> AnyPublisher<[OfferDTO], Never>
    func observeCachedList(predicate: NSPredicate) -> AnyPublisher<[OfferDTO], Never>
}
