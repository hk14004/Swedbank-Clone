//
//  LanguageScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import Foundation
import DevToolsUI
import DevToolsLocalization

class LanguageScreenVMImpl: ObservableObject {
    
    var navigationBindings: LanguageScreenVMNavigationBindings = .init()
    @Published var sections: [LanguageScreenSection] = []
    var sectionsPublisher: Published<[LanguageScreenSection]>.Publisher {
        $sections
    }
    private let loc: RuntimeLocalization = DI.container.resolve(RuntimeLocalization.self)!
    
    init() {
        startup()
    }
}

extension LanguageScreenVMImpl: LanguageScreenVM {
    func onSelectedLanguage(code: String) {
        loc.change(languageCode: code)
        navigationBindings.onSelected?()
    }
}

// MARK: Private

extension LanguageScreenVMImpl {
    private func startup() {
        sections = makeSections()
    }
    
    private func makeSections() -> [LanguageScreenSection] {
        [
            makeLanguageSection()
        ]
    }
    
    private func makeLanguageSection() -> LanguageScreenSection {
        return .init(identifier: .selectLanguage,
                     title: "Language",
                     cells: makeLangSelectCells(for: loc.getAvailableLanguages()))
    }
    
    private func makeLangSelectCells(for languages: [String]) -> [LanguageScreenSection.Cell] {
        languages.map { code in
            LanguageScreenSection.Cell.language(LanguageScreenItem(flagName: Globals.makeLanguageFlagName(language: code),
                                                                   title: Globals.makeLanguageNameKey(language: code),
                                                                   languageCode: code,
                                                                   selected: loc.getCurrentLanguage() == code))
        }
    }
}
