//
//  LogoutUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 31/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol LogoutUseCase {
    func use() -> AnyPublisher<Void, Never>
}

public class DefaultLogoutUseCase: LogoutUseCase {
    // MARK: Properties
    private let customerRepository: CustomerRepository
    private let nukeCustomerPersistedDataUseCase: NukeCustomerPersistedDataUseCase
    
    // MARK: Lifeycle
    public init(
        customerRepository: CustomerRepository,
        nukeCustomerPersistedDataUseCase: NukeCustomerPersistedDataUseCase
    ) {
        self.customerRepository = customerRepository
        self.nukeCustomerPersistedDataUseCase = nukeCustomerPersistedDataUseCase
    }
    
    // MARK: Methods
    public func use() -> AnyPublisher<Void, Never> {
        guard let loggedInCustomer =  customerRepository.getCurrentCustomer() else {
            return .just(())
        }
        customerRepository.setCurrentCustomer(nil)
        return nukeCustomerPersistedDataUseCase.use(customerId: loggedInCustomer.id)
    }
}
