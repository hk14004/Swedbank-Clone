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

class UserSessionAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BaseUserSessionCredentialsStore<UserSessionCredentials>.self) { resolver in
            DefaultUserSessionCredentialsStore()
        }
        container.register(UserSessionManager.self) { resolver in
            UserSessionManager(
                credentialsStore: resolver.resolve(BaseUserSessionCredentialsStore<UserSessionCredentials>.self)!,
                userSessionFactory: BaseUserSessionFactory<UserSessionCredentials>()
            )
        }
    }
}
