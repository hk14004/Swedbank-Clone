//
//  DefaultFetchCustomersService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation

extension DefaultFetchCustomersService {
    typealias FetchCustomersResponse = [CustomerResponseItem]

    struct CustomerResponseItem: Codable {
        let id: String
        let displayName: String
    }
}
