//
//  SwedbankUserSession.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import Foundation
import DevToolsCore

class SwedbankUserSession: UserSession {
    var credentials: SwedbankUserSessionCredentials
    
    init(credentials: SwedbankUserSessionCredentials) {
        self.credentials = credentials
    }
}
