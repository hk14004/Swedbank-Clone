//
//  MockFetchCustomerService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

class MockFetchCustomerService: FetchCustomerService {
    
    var mockResult: AnyPublisher<FetchCustomerServiceOutput, Error>!
    func use(input: FetchCustomerServiceInput) -> AnyPublisher<FetchCustomerServiceOutput, Error> {
        mockResult
    }
}
