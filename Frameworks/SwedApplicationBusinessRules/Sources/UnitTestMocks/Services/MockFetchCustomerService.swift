//
//  MockFetchCustomerService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

class MockFetchCustomerService: FetchRemoteCustomersService {
    var mockResult: AnyPublisher<FetchRemoteCustomersServiceOutput, Error>!
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        mockResult
    }
}
