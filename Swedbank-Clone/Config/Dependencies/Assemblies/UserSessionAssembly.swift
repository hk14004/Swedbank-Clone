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
        container.register((any UserSessionManager).self) { _ in
            return SwedbankUserSessionManager()
        }
        container.register((any UserSessionFactory).self) { _ in
            return SwedbankUserSessionFactory()
        }
    }
    
}
