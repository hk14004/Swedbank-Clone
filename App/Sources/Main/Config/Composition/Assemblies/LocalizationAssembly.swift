//
//  LocalizationAssembly.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Swinject
import DevToolsLocalization

typealias AppLocalization = RuntimeLocalization
typealias AppLocalizationObserver = RuntimeLocalizationObserver
typealias AppLocalizedPreview = RuntimeLocalizedPreview

class LocalizationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppLocalization.self) { resolver in
            RuntimeStringFileLocalization.shared
        }.inObjectScope(.container)
        container.register(AppLocalizationObserver.self) { resolver in
            RuntimeLocalizationObserver()
        }.inObjectScope(.container)
    }
}
