//
//  GetCurrentCustomerUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol NukeCustomerPersistedDataUseCase {
    func use() -> AnyPublisher<Void, Never>
}

public struct DefaultNukeCustomerPersistedDataUseCase: NukeCustomerPersistedDataUseCase {
    private let customerRepository: CustomerRepository
    private let offerRepository: OfferRepository
    private let accountRepository: AccountRepository
    
    public init(
        customerRepository: CustomerRepository,
        offerRepository: OfferRepository,
        accountRepository: AccountRepository
    ) {
        self.customerRepository = customerRepository
        self.offerRepository = offerRepository
        self.accountRepository = accountRepository
    }
    
    public func use() -> AnyPublisher<Void, Never> {
        customerRepository.replace(with: [])
            .flatMap { _ in
                offerRepository.replace(with: [])
            }
            .flatMap { _ in
                accountRepository.replace(with: [])
            }
            .eraseToAnyPublisher()
    }
}
