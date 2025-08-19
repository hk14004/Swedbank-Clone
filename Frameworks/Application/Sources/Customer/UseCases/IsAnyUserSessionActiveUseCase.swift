//
//  IsUserSessionActiveUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol IsAnyUserSessionActiveUseCase {
    func use() -> Bool
}

public struct DefaultIsAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase {
        
    private let customerRepository: CustomerRepository
    
    public init(customerRepository: CustomerRepository) {
        self.customerRepository = customerRepository
    }
    
    public func use() -> Bool {
        customerRepository.getCurrentCustomer() != nil
    }
}
