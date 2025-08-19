//
//  LanguageSelectionVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

public protocol LanguageSelectionScreenVMInput {
    func onClose()
    func onChangeLanguage(code: String)
}

public protocol LanguageSelectionScreenVMOutput {
    var selectedLanguage: String { get set }
    var availableLanguages: [String] { get set }
    var router: LanguageSelectionRouter! { get set }
}

public protocol LanguageSelectionScreenVM: ObservableObject, LanguageSelectionScreenVMInput, LanguageSelectionScreenVMOutput {}

public class DefaultLanguageSelectionScreenVM: LanguageSelectionScreenVM {
    public var router: LanguageSelectionRouter!
    @Published public var selectedLanguage: String
    @Published public var availableLanguages: [String]
    private let getCurrentLanguageUseCase: GetCurrentLanguageUseCase
    private let getAvailableLanguagesUseCase: GetAvailableLanguagesUseCase
    private let setCurrentLanguagesUseCase: SetCurrentLanguagesUseCase
    
    public init(
        getCurrentLanguageUseCase: GetCurrentLanguageUseCase,
        getAvailableLanguagesUseCase: GetAvailableLanguagesUseCase,
        setCurrentLanguagesUseCase: SetCurrentLanguagesUseCase
    ) {
        self.getCurrentLanguageUseCase = getCurrentLanguageUseCase
        self.getAvailableLanguagesUseCase = getAvailableLanguagesUseCase
        self.setCurrentLanguagesUseCase = setCurrentLanguagesUseCase
        self.selectedLanguage = getCurrentLanguageUseCase.use()
        self.availableLanguages = getAvailableLanguagesUseCase.use()
    }
}

// MARK: Public
public extension DefaultLanguageSelectionScreenVM {
    func onClose() {
        router.selectedLanguage(code: selectedLanguage)
    }
    
    func onChangeLanguage(code: String) {
        selectedLanguage = code
        setCurrentLanguagesUseCase.use(languageCode: code)
        onClose()
    }
}
