//
//  DefaultLanguageRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplication

class DefaultLanguageRepository: LanguageRepository {
    private let appLocalization: AppLocalization
    
    init(appLocalization: AppLocalization) {
        self.appLocalization = appLocalization
    }
    
    func getCurrentLanguage() -> LanguageKey {
        appLocalization.getCurrentLanguage()
    }
    
    func getAvailableLanguages() -> [LanguageKey] {
        appLocalization.getAvailableLanguages()
    }
    
    func updateCurrentLanguage(code: LanguageKey) {
        appLocalization.change(languageCode: code)
    }
    
    func observeCurrentLanguage() -> AnyPublisher<LanguageKey, Never> {
        appLocalization.observeCurrentLanguage()
    }
}
