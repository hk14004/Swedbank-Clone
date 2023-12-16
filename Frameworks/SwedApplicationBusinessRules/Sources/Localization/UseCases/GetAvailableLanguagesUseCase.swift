//
//  GetAvailableLanguagesUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol GetAvailableLanguagesUseCase {
    func use() -> [LanguageKey]
}

public class DefaultGetAvailableLanguagesUseCase: GetAvailableLanguagesUseCase {
    public init() {}
    public func use() -> [LanguageKey] {
        ["lv", "en"]
    }
}
