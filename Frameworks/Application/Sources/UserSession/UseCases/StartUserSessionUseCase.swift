//
//  StartUserSessionUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol StartUserSessionUseCase {
    func use(customer: Customer) -> AnyPublisher<Void, Error>
}

public struct DefaultStartUserSessionUseCase: StartUserSessionUseCase {
    private let customerRepository: CustomerRepository
    
    public init(customerRepository: CustomerRepository) {
        self.customerRepository = customerRepository
    }
    
    public func use(customer: Customer) -> AnyPublisher<Void, Error> {
        customerRepository.setCurrentCustomer(customer)
        return .just(())
    }
}
