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
        ""
    }
    
    var path: String {
        ""
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var authType: DevRequestAuthType {
        .bearer
    }
}
