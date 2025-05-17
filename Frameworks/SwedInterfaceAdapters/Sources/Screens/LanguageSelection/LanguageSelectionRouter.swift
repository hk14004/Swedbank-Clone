//
//  LanguageSelectionRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol LanguageSelectionRouter {
    func selectedLanguage(code: String)
}

public protocol ToLanguageSelectionScreenRouting {
    func routeToLanguageSelectionScreen()
}
