//
//  SwedbankUserSessionFactory.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 08/06/2023.
//

import Foundation
import DevToolsCore

struct SwedbankUserSessionFactory: UserSessionFactory {
    func makeUserSession(with credentials: SwedbankUserSessionCredentials) -> SwedbankUserSession {
        return SwedbankUserSession(credentials: credentials)
    }
}
