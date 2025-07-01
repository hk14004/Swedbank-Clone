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
    private let currentCustomerStore: CurrentCustomerStore
    private let localStore: BasePersistedLayerInterface<Customer>

    init(
        fetchRemoteCustomersService: FetchRemoteCustomersService,
        localStore: BasePersistedLayerInterface<Customer>,
        currentCustomerStore: CurrentCustomerStore
    ) {
        self.fetchRemoteCustomersService = fetchRemoteCustomersService
        self.localStore = localStore
        self.currentCustomerStore = currentCustomerStore
    }
    
    func getRemoteCustomers() -> AnyPublisher<[Customer], Error> {
        fetchRemoteCustomersService.use()
            .flatMap { [weak self] customers -> AnyPublisher<[Customer], Never> in
                self?.replace(with: customers)
                    .map { _ in customers }
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
    
    func addOrUpdate(_ items: [Customer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.addOrUpdate(items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getSingle(id: String) -> AnyPublisher<Customer?, Never> {
        Future<Customer?, Never> { [weak self] promise in
            Task {
                let customer = try await self?.localStore.getSingle(id: id)
                promise(.success(customer))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getSingle(id: String) -> Customer? {
        try? localStore.getSingle(id: id)
    }
    
    func replace(with items: [Customer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getCurrentCustomer() -> Customer? {
        currentCustomerStore.getCurrentCustomer()
    }
    
    func setCurrentCustomer(_ customer: Customer?) {
        currentCustomerStore.setCurrentCustomer(customer)
    }
}
