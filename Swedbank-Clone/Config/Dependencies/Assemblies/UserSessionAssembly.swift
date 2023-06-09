//
//  UserSessionAssembly.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 11/05/2023.
//

import Foundation
import Swinject
import DevToolsCore

class UserSessionAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(BaseUserSessionCredentialsStore<SwedbankUserSessionCredentials>.self) { _ in
            return UserSessionCredentialsStoreImpl()
        }.inObjectScope(.container)
        container.register(BaseUserSessionFactory<SwedbankUserSessionCredentials>.self) { _ in
            return UserSessionFactoryImpl()
        }.inObjectScope(.container)
        container.register(BaseUserSessionManager<SwedbankUserSessionCredentials>.self) { resolver in
            return UserSessionManagerImpl(credentialsStore: resolver.resolve(BaseUserSessionCredentialsStore<SwedbankUserSessionCredentials>.self)!,
                                          userSessionFactory: resolver.resolve(BaseUserSessionFactory<SwedbankUserSessionCredentials>.self)!)
        }.inObjectScope(.container)
    }
    
}
