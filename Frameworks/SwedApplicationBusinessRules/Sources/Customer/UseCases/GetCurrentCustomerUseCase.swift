//
//  GetCurrentCustomerUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol GetCurrentCustomerUseCase {
    func use() -> Customer?
}

public struct DefaultGetCurrentCustomerUseCase: GetCurrentCustomerUseCase {
    private let customerRepository: CustomerRepository
    
    public init(customerRepository: CustomerRepository) {
        self.customerRepository = customerRepository
    }
    
    public func use() -> Customer? {
        customerRepository.getCurrentCustomer()
    }
}
