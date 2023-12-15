//
//  FetchCustomerRequestConfig.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsNetworking

enum FetchCustomerRequestConfig {
    case fetch(FetchCustomerServiceOutgoing)
}

extension FetchCustomerRequestConfig: DevRequestConfig {
    var baseURL: String {
        ""
    }
    
    var path: String {
        ""
    }
    
    var method: DevHTTPMethod {
        .post
    }
    
    var authType: DevRequestAuthType {
        .none
    }
    
    
}
