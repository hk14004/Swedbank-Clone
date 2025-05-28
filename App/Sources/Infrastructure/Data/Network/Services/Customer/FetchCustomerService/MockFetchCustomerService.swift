//
//  MockFetchCustomerService.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplicationBusinessRules

class MockFetchCustomerService: FetchRemoteCustomersService {
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        .just([JAMES_BOND])
    }
}
