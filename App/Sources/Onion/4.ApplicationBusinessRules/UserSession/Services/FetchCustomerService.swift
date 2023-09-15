//
//  FetchCustomerService.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 14/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

protocol FetchCustomerService {
    func use(input: FetchCustomerServiceInput) -> AnyPublisher<FetchCustomerServiceOutput, Error>
}

struct FetchCustomerServiceInput {
    let customerID: String
}

struct FetchCustomerServiceOutput {
    let data: CustomerDTO
}

struct CustomerDTO {
    let id: String
    let name: String
    let surname: String
}
