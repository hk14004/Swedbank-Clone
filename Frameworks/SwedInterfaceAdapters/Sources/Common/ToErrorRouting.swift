//
//  ToErrorRouting.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Kirsis on 19/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol ToErrorRouting {
    func routeToErrorAlert(_ error: Error)
}
