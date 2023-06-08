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
        container.register(SwedbankUserSessionCredentialsStore.self) { _ in
            return SwedbankUserSessionCredentialsStore()
        }.inObjectScope(.container)
        container.register(SwedbankUserSessionFactory.self) { _ in
            return SwedbankUserSessionFactory()
        }.inObjectScope(.container)
        container.register((any UserSessionManager).self) { resolver in
            return SwedbankUserSessionManager(credentialsStore: resolver.resolve(SwedbankUserSessionCredentialsStore.self)!,
                                              userSessionFactory: resolver.resolve(SwedbankUserSessionFactory.self)!)
        }
        container.register((any UserSessionFactory).self) { _ in
            return SwedbankUserSessionFactory()
        }
    }
    
}
