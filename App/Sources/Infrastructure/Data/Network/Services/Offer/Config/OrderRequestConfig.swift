//
//  OrderRequestConfig.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsNetworking

enum OrderRequestConfig {
    case fetchOrders
}

extension OrderRequestConfig: DevRequestConfig {
    var baseURL: String {
        "https://github.com"
    }

    var path: String {
        switch self {
        case .fetchOrders:
            "/hk14004/Swedbank-Clone/raw/refs/heads/dev/App/Resources/Payloads/orders.json"
        }
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var authType: DevRequestAuthType {
        .none
    }
}
