//
//  FakeAlreadyLoggedInUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol FakeAlreadyLoggedInUseCase {
    func use() -> AnyPublisher<Void, Never>
}

public struct DefaultFakeAlreadyLoggedInUseCase: FakeAlreadyLoggedInUseCase {
    
    let customerRepository: CustomerRepository
    
    public init(customerRepository: CustomerRepository) {
        self.customerRepository = customerRepository
    }
    
    public func use() -> AnyPublisher<Void, Never> {
        return customerRepository.replace(with: [JAMES_BOND])
    }
}

let JAMES_BOND = Customer(
    id: "007",
    displayName: "James Bond",
    type: .private,
    hasIpRestriction: false,
    hasUsableAccounts: true,
    sortOrder: 0,
    roles: [.private],
    authorities: [],
    isMain: true
)
