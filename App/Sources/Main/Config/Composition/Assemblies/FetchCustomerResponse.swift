//
//  FetchCustomerResponse.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

struct FetchCustomerResponse: Codable {
    let id: String
    let name: String
    let surname: String
}
