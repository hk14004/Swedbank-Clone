//
//  UserSessionAssembly.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules
import KeychainAccess

class UserSessionAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BaseUserSessionFactory<UserSessionCredentials>.self) { resolver in
            BaseUserSessionFactory<UserSessionCredentials>()
        }.inObjectScope(.container)
        container.register(UserSessionManager.self) { resolver in
            UserSessionManager(
                credentialsStore: Composition.resolve(),
                userSessionFactory: Composition.resolve()
            )
        }.inObjectScope(.container)
    }
}
