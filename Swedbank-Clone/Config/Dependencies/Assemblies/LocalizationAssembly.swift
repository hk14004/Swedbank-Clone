//
//  LocalizationAssembly.swift
//  CatalogViewer
//
//  Created by Hardijs Ķirsis on 11/05/2023.
//

import Foundation
import Swinject
import DevToolsLocalization

class LocalizationAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(RuntimeLocalization.self) { _ in
            return RuntimeStringFileLocalization.shared
        }.inObjectScope(.container)
    }
    
}
