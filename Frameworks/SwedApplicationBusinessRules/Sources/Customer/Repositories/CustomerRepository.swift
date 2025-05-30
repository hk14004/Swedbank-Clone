//
//  CustomerRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol CustomerRepository {
    func addOrUpdate(_ items: [CustomerDTO]) -> AnyPublisher<Void, Never>
    func getSingle(id: String) -> AnyPublisher<CustomerDTO?, Never>
    func getRemoteCustomers() -> AnyPublisher<[CustomerDTO], Never>
}
