//
//  DependencyProvider.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import Foundation
import Swinject

let DIP = DependencyProvider()

class DependencyProvider {

    let container = Container()
    let assembler: Assembler

    init() {
        assembler = Assembler(
            [
                DataMapperAssembly(),
                DataProviderAssambly(),
                PersistentCoreDataStoreAssembly(),
                RepositoryAssembly(),
                LocalizationAssembly()
            ],
            container: container
        )
    }
}
