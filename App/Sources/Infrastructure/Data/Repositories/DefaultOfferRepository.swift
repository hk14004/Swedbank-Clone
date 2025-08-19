//
//  DefaultOfferRepository.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import SwedApplication
import SwedEnterprise
import Combine
import Foundation
import DevToolsPersistance

class DefaultOfferRepository: OfferRepository {
    private let localStore: any OfferPersistedLayerInterface
    private let fetchRemoteOffersService: FetchRemoteOffersService
    
    init(
        store: any OfferPersistedLayerInterface,
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
    
    func observeCachedList() -> AnyPublisher<[Offer], Never> {
        localStore.observeList(predicate: nil, sortDescriptors: [.init(\.id, order: .forward)])
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    func getRemoteOffers() -> AnyPublisher<[Offer], Error> {
        fetchRemoteOffersService.use()
            .flatMap { [weak self] offers in
                self?.replace(with: offers)
                    .mapToVoid()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .flatMap { [weak self] _ -> AnyPublisher<[Offer], Never> in
                self?.fetchStored()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchStored() -> AnyPublisher<[Offer], Never> {
        Future<[Offer], Never> { [weak self] promise in
            Task {
                let value = try await self?.localStore.getList(predicate: nil, sortDescriptors: [.init(\.id, order: .forward)]) ?? []
                promise(.success(value))
            }
        }
        .eraseToAnyPublisher()
    }
}
