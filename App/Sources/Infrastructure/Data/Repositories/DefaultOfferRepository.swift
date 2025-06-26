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
    private let localStore: BasePersistedLayerInterface<Offer>
    private let fetchRemoteOffersService: FetchRemoteOffersService
    
    init(
        store: BasePersistedLayerInterface<Offer>,
        fetchRemoteOffersService: FetchRemoteOffersService
    ) {
        self.localStore = store
        self.fetchRemoteOffersService = fetchRemoteOffersService
    }
    
    func replace(with items: [Offer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func observeCachedList(predicate: NSPredicate) -> AnyPublisher<[Offer], Never> {
        localStore.observeList(predicate: predicate)
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    func getRemoteOffers() -> AnyPublisher<[Offer], Never> {
        fetchRemoteOffersService.use()
            .catch { _ in
                Just([])
            }
            .flatMap { [weak self] offers -> AnyPublisher<[Offer], Never> in
                self?.replace(with: offers)
                    .map { _ in offers }
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
}
