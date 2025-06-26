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

class DefaultAccountRepository: AccountRepository {
    private let localStore: BasePersistedLayerInterface<AccountDTO>
    private let fetchRemoteAccountsService: FetchRemoteAccountsService
    
    init(
        store: BasePersistedLayerInterface<AccountDTO>,
        fetchRemoteAccountsService: FetchRemoteAccountsService
    ) {
        self.localStore = store
        self.fetchRemoteAccountsService = fetchRemoteAccountsService
    }
    
    func replace(with items: [Account]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items.map { AccountDTO(account: $0) } )
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func observeCachedList(predicate: NSPredicate) -> AnyPublisher<[Account], Never> {
        localStore.observeList(predicate: predicate)
            .tryMap {
                try $0.map { try $0.toAccount() }.sorted { $0.sortOrder < $1.sortOrder }
            }
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    func getRemoteAccounts() -> AnyPublisher<[Account], Never> {
        fetchRemoteAccountsService.use()
            .map { $0.sorted { $0.sortOrder < $1.sortOrder } }
            .catch { _ in
                Just([])
            }
            .flatMap { [weak self] accounts -> AnyPublisher<[Account], Never> in
                self?.replace(with: accounts)
                    .map { _ in accounts }
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
}
