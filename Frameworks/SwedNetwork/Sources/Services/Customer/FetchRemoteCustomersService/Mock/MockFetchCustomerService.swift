//
//  MockFetchCustomerService.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplication

class MockFetchCustomerService: FetchRemoteCustomersService {
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        .just([JAMES_BOND])
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
