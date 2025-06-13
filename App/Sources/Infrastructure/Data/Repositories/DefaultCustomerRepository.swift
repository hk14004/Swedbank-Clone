//
//  DefaultCustomerRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwedApplicationBusinessRules
import Combine
import DevToolsCore

class DefaultCustomerRepository: CustomerRepository {
    
    private let fetchRemoteCustomersService: FetchRemoteCustomersService
    private let localStore: BasePersistedLayerInterface<CustomerDTO>
    
    init(
        fetchRemoteCustomersService: FetchRemoteCustomersService,
        localStore: BasePersistedLayerInterface<CustomerDTO>
    ) {
        self.fetchRemoteCustomersService = fetchRemoteCustomersService
        self.localStore = localStore
    }
    
    func getRemoteCustomers() -> AnyPublisher<[CustomerDTO], Never> {
        fetchRemoteCustomersService.use()
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    func addOrUpdate(_ items: [CustomerDTO]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.addOrUpdate(items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getSingle(id: String) -> AnyPublisher<CustomerDTO?, Never> {
        Future<CustomerDTO?, Never> { [weak self] promise in
            Task {
                let customer = try await self?.localStore.getSingle(id: id)
                promise(.success(customer))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func replace(with items: [CustomerDTO]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
}
