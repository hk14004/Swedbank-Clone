//
//  DefaultLanguageRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplication
import SwedLocalization
import DevToolsLocalization

public class DefaultLanguageRepository: LanguageRepository {
    private let appLocalization: RuntimeLocalization
    
    public init(appLocalization: RuntimeLocalization) {
        self.appLocalization = appLocalization
    }
    
    public func getCurrentLanguage() -> LanguageKey {
        appLocalization.getCurrentLanguage()
    }
    
    public func getAvailableLanguages() -> [LanguageKey] {
        appLocalization.getAvailableLanguages()
    }
    
    public func updateCurrentLanguage(code: LanguageKey) {
        appLocalization.change(languageCode: code)
    }
    
    public func observeCurrentLanguage() -> AnyPublisher<LanguageKey, Never> {
        appLocalization.observeCurrentLanguage()
    }
}
