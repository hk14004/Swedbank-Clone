//
//  LanguageRepository.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol LanguageRepository {
    func getCurrentLanguage() -> LanguageKey
    func getAvailableLanguages() -> [LanguageKey]
    func updateCurrentLanguage(code: LanguageKey)
    func observeCurrentLanguage() -> AnyPublisher<LanguageKey, Never>
}
