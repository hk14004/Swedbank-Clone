//
//  DI.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Swinject

let DI = DependencyProvider()

class DependencyProvider {

    let container = Container()
    let assembler: Assembler

    init() {
        assembler = Assembler(
            [
//                DataMapperAssembly(),
//                DataProviderAssambly(),
//                PersistentCoreDataStoreAssembly(),
//                RepositoryAssembly(),
//                LocalizationAssembly(),
//                UserSessionAssembly(),
//                ScreenCoordinatorAssembly(),
//                NavigationCoordinatorAssembly()
            ],
            container: container
        )
    }
}
