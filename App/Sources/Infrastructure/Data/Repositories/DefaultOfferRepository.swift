//
//  DefaultOfferRepository.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import SwedApplicationBusinessRules
import SwedEnterpriseBusinessRules
import Combine
import Foundation

class DefaultOfferRepository: OfferRepository {
    func replace(with items: [Offer]) -> AnyPublisher<Void, Never> {
        .just(())
    }
    
    func getList(predicate: NSPredicate) -> AnyPublisher<[Offer], Never> {
        .just([])
    }
}
