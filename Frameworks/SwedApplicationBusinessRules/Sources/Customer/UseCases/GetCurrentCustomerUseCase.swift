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
    func use() -> AnyPublisher<Customer?, Never>
}

public struct DefaultGetCurrentCustomerUseCase: GetCurrentCustomerUseCase {
    private let userSessionManager: UserSessionManager
    private let customerRepository: CustomerRepository
    
    public init(
        userSessionManager: UserSessionManager,
        customerRepository: CustomerRepository
    ) {
        self.userSessionManager = userSessionManager
        self.customerRepository = customerRepository
    }
    
    public func use() -> AnyPublisher<Customer?, Never> {
        guard let currentCustomerID = userSessionManager.startedUserSessions.first?.value.credentials.id else {
            return .just(nil)
        }
        return customerRepository.getSingle(id: currentCustomerID)
    }
}
