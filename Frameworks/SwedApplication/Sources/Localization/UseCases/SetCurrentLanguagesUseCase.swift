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
    private let languageRepository: LanguageRepository
    
    public init(languageRepository: LanguageRepository) {
        self.languageRepository = languageRepository
    }
    public func use(languageCode: LanguageKey) {
        languageRepository.updateCurrentLanguage(code: languageCode)
    }
}
