//
//  GetLastCustomerUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol GetLastCustomerUseCase {
    func use() -> Customer?
}

public struct MockGetLastCustomerUseCase: GetLastCustomerUseCase {
    
    private let customerRepository: CustomerRepository
    
    public init(customerRepository: CustomerRepository) {
        self.customerRepository = customerRepository
    }
    
    public func use() -> Customer? {
        customerRepository.getSingle(id: JAMES_BOND.id)
    }
}
