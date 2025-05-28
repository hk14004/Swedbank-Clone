//
//  LocalizationAssembly.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Swinject
import DevToolsLocalization
import SwedLocalization

class LocalizationAssembly: Assembly {
    init() {
        configure()
    }
    
    func assemble(container: Container) {
        container.register(AppLocalization.self) { resolver in
            RuntimeStringFileLocalization.shared
        }.inObjectScope(.container)
        container.register(AppLocalizationObserver.self) { resolver in
            RuntimeLocalizationObserver()
        }.inObjectScope(.container)
    }
}

extension LocalizationAssembly {
    private func configure() {
        RuntimeStringFileLocalization.shared.bundle = SwedLocalizationResources.bundle
    }
}
