//
//  GetCurrentLanguageUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol GetCurrentLanguageUseCase {
    func use() -> LanguageKey
}

public class DefaultGetCurrentLanguageUseCase: GetCurrentLanguageUseCase {
    
    public init() {}
    
    public func use() -> LanguageKey {
        "lv"
    }
}
