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
    
    public init(
        customerRepository: CustomerRepository,
        offerRepository: OfferRepository
    ) {
        self.customerRepository = customerRepository
        self.offerRepository = offerRepository
    }
    
    public func use() -> AnyPublisher<Void, Never> {
        customerRepository.replace(with: [])
            .flatMap { _ in
                offerRepository.replace(with: [])
            }
            .eraseToAnyPublisher()
    }
}
