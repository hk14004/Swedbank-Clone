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
import DevToolsCore

class DefaultOfferRepository: OfferRepository {
    private let store: BasePersistedLayerInterface<OfferDTO>
    
    init(store: BasePersistedLayerInterface<OfferDTO>) {
        self.store = store
    }
    
    func replace(with items: [OfferDTO]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                await self?.store.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getList(predicate: NSPredicate) -> AnyPublisher<[OfferDTO], Never> {
        Future<[OfferDTO], Never> { [weak self] promise in
            Task {
                let result = await self?.store.getList(predicate: predicate) ?? []
                promise(.success(result))
            }
        }
        .eraseToAnyPublisher()
    }
}
