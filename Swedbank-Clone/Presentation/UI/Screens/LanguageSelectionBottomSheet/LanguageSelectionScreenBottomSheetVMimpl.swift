//
//  LanguageSelectionScreenBottomSheetVMimpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import Foundation
import DevToolsLocalization

class LanguageSelectionScreenBottomSheetVMImpl {
    @Published var selectedLanguage: String = ""
    @Published var availableLanguages: [String] = []
    var navigationBindings: LanguageSelectionScreenBottomSheetVMNavigationBindings = .init()
    private let loc: RuntimeLocalization = DIP.container.resolve(RuntimeLocalization.self)!
    
    init() {
        startup()
    }
}

extension LanguageSelectionScreenBottomSheetVMImpl: LanguageSelectionScreenBottomSheetVM {
         
    func onClose() {
        navigationBindings.onClose?()
    }
    
    func onChangeLanguage(code: String) {
        loc.change(languageCode: code)
        onClose()
    }
    
}

// MARK: Private

extension LanguageSelectionScreenBottomSheetVMImpl {
    private func startup() {
        selectedLanguage = loc.getCurrentLanguage()
        availableLanguages = loc.getAvailableLanguages()
    }
}
