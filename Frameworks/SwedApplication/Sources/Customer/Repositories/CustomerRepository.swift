//
//  CustomerRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol CustomerRepository {
    func replace(with items: [Customer]) -> AnyPublisher<Void, Never>
    func addOrUpdate(_ items: [Customer]) -> AnyPublisher<Void, Never>
    func getSingle(id: String) -> AnyPublisher<Customer?, Never>
    func getSingle(id: String) -> Customer?
    func getRemoteCustomers() -> AnyPublisher<[Customer], Error>
    func getCurrentCustomer() -> Customer?
    func setCurrentCustomer(_ customer: Customer?)
    func getLastUsedCustomer() -> Customer?
}
