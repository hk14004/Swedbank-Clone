//
//  FetchCustomersResponse.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

typealias FetchCustomersResponse = [FetchCustomersResponseCustomer]

struct FetchCustomersResponseCustomer: Codable {
    let id: String
    let displayName: String
}
