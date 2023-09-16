//
//  FetchCustomerService.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 14/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol FetchCustomerService {
    func use(input: FetchCustomerServiceInput) -> AnyPublisher<FetchCustomerServiceOutput, Error>
}

public struct FetchCustomerServiceInput {
    public let customerID: String
}

public struct FetchCustomerServiceOutput {
    public let customer: CustomerDTO
    
    public init(customer: CustomerDTO) {
        self.customer = customer
    }
}

public struct CustomerDTO {
    public let id: String
    public let name: String
    public let surname: String
    
    public init(id: String, name: String, surname: String) {
        self.id = id
        self.name = name
        self.surname = surname
    }
}
