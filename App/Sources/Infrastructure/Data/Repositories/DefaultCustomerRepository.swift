//
//  DefaultCustomerRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwedApplicationBusinessRules
import Combine

class DefaultCustomerRepository: CustomerRepository {
    
    private let fetchRemoteCustomersService: FetchRemoteCustomersService
    
    init(fetchRemoteCustomersService: FetchRemoteCustomersService) {
        self.fetchRemoteCustomersService = fetchRemoteCustomersService
    }
    
    func getRemoteCustomers() -> AnyPublisher<[CustomerDTO], Never> {
        fetchRemoteCustomersService.use()
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    func addOrUpdate(_ items: [CustomerDTO]) -> AnyPublisher<Void, Never> {
        .just(())
    }
    
    func getSingle(id: String) -> AnyPublisher<CustomerDTO?, Never> {
        .just(JAMES_BOND)
    }
}
