//
//  SetCurrentLanguagesUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol SetCurrentLanguagesUseCase {
    func use(languageCode: LanguageKey)
}

public class DefaultSetCurrentLanguagesUseCase: SetCurrentLanguagesUseCase {
    public init() {}
    public func use(languageCode: LanguageKey) {
        // TODO: Implement
        print("Implement DefaultSetCurrentLanguagesUseCase")
    }
}
