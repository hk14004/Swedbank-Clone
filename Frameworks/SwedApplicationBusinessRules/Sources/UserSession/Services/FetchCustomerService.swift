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
    let customerID: String
}

public struct FetchCustomerServiceOutput {
    let data: CustomerDTO
}

public struct CustomerDTO {
    let id: String
    let name: String
    let surname: String
}
