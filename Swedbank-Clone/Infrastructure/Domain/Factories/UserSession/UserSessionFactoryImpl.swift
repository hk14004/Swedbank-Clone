//
//  UserSessionFactoryImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 09/06/2023.
//

import Foundation
import DevToolsCore

class UserSessionFactoryImpl: BaseUserSessionFactory<SwedbankUserSessionCredentials> {
    override func makeUserSession(with credentials: SwedbankUserSessionCredentials) -> BaseUserSession<SwedbankUserSessionCredentials> {
        return UserSessionImpl(credentials: credentials)
    }
}
