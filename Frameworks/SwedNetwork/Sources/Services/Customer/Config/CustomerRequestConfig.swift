//
//  FetchCustomersRequestConfig.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsNetworking

enum CustomerRequestConfig {
    case fetchCustomers
}

extension CustomerRequestConfig: DevRequestConfig {
    var baseURL: String {
        "http://192.168.8.208:3000/api"
    }

    var path: String {
        switch self {
        case .fetchCustomers:
            "/customers"
        }
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var requiresAuthorization: Bool {
        true
    }
}
