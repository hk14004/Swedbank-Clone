//
//  GetLastCustomerUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

let JAMES_BOND = CustomerDTO(
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

public protocol GetLastCustomerUseCase {
    func use() -> CustomerDTO
}

// Mocked for now
public struct MockGetLastCustomerUseCase: GetLastCustomerUseCase {
    public init() {}
    public func use() -> CustomerDTO {
        JAMES_BOND
    }
}
