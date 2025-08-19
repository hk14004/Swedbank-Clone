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
import SwedNetwork
import SwedApplication
import SwedPersistance


class DefaultAccountRepository: AccountRepository {
    private let localStore: any AccountPersistedLayerInterface
    private let fetchRemoteAccountsService: FetchRemoteAccountsService
    
    init(
        store: any AccountPersistedLayerInterface,
        fetchRemoteAccountsService: FetchRemoteAccountsService
    ) {
        self.localStore = store
        self.fetchRemoteAccountsService = fetchRemoteAccountsService
    }
    
    func replace(with items: [Account]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func observeCachedList() -> AnyPublisher<[Account], Never> {
        localStore.observeList(predicate: nil, sortDescriptors: [.init(\.sortOrder)])
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    func getRemoteAccounts() -> AnyPublisher<[Account], Never> {
        fetchRemoteAccountsService.use()
            .catch { _ in
                Just([])
            }
            .flatMap { [weak self] accounts in
                self?.replace(with: accounts)
                    .mapToVoid()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .flatMap { [weak self] _ -> AnyPublisher<[Account], Never> in
                self?.fetchStored()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchStored() -> AnyPublisher<[Account], Never> {
        Future<[Account], Never> { [weak self] promise in
            Task {
                let value = try await self?.localStore.getList(predicate: nil, sortDescriptors: [.init(\.sortOrder)]) ?? []
                promise(.success(value))
            }
        }
        .eraseToAnyPublisher()
    }
}
