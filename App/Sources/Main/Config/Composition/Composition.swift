//
//  Composition.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Swinject

class Composition {
    // MARK: - Properties
    static let shared = Composition()
    let container = Container()
    private let assembler: Assembler
    
    // MARK: - Lifecycle
    private init() {
        assembler = Assembler(
            [
                LocalizationAssembly(),
                StorageAssembly(),
                NetworkClientAssembly(),
                ServicesAssembly(),
                RepositoryAssembly(),
                UseCaseAssembly(),
                ScreenFactoryAssembly()
            ],
            container: container
        )
    }
    
    static func resolve<T>() -> T {
        shared.container.resolve(T.self)!
    }
    
    func resolve<T>() -> T {
        container.resolve(T.self)!
    }
}
