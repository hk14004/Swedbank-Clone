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
    private let localStore: BasePersistedLayerInterface<OfferDTO>
    private let fetchRemoteOffersService: FetchRemoteOffersService
    
    init(
        store: BasePersistedLayerInterface<OfferDTO>,
        fetchRemoteOffersService: FetchRemoteOffersService
    ) {
        self.localStore = store
        self.fetchRemoteOffersService = fetchRemoteOffersService
    }
    
    func replace(with items: [OfferDTO]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func observeCachedList(predicate: NSPredicate) -> AnyPublisher<[OfferDTO], Never> {
        localStore.observeList(predicate: predicate)
    }
    
    func getRemoteOffers() -> AnyPublisher<[OfferDTO], Never> {
        fetchRemoteOffersService.use()
            .flatMap { [weak self] offers -> AnyPublisher<[OfferDTO], Never> in
                self?.replace(with: offers)
                    .map { _ in offers }
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
}
