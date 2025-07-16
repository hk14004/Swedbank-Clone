//
//  AccountRequestConfig.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsNetworking

enum AccountRequestConfig {
    case fetchAccounts
}

extension AccountRequestConfig: DevRequestConfig {
    var baseURL: String {
        "http://192.168.8.208:3000/api"
    }

    var path: String {
        switch self {
        case .fetchAccounts:
            "/accounts"
        }
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var requiresAuthorization: Bool {
        true
    }
}
