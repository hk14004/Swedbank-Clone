//
//  Composition.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Swinject

class Composition {
    
    let container = Container()
    let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [
                ScreenAssembly()
            ],
            container: container
        )
    }
}
