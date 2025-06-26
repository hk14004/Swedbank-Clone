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
    
    func getRemoteCustomers() -> AnyPublisher<[Customer], Never> {
        fetchRemoteCustomersService.use()
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    func addOrUpdate(_ items: [Customer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.addOrUpdate(items.map { try CustomerDTO(customer: $0) } )
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getSingle(id: String) -> AnyPublisher<Customer?, Never> {
        Future<Customer?, Never> { [weak self] promise in
            Task {
                let customer = try await self?.localStore.getSingle(id: id)?.toCustomer()
                promise(.success(customer))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func replace(with items: [Customer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items.map { try CustomerDTO(customer: $0) } )
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
}
