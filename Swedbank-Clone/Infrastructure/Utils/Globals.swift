//
//  Globals.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import Foundation
import DevToolsUI
import Localize_Swift

class Globals {
    
}

extension Globals {
    static func makeLanguageFlagName(language: String) -> String {
        let prefix = "ic_"
        let suffix = "_flag"
        return prefix + language + suffix
    }
    
    static func previewLanguage() -> String {
        return "en"
    }
}

extension LocalizedPreview {
    init(langCode: String = Globals.previewLanguage()) {
        self.init(languageSetClosure: {
            Localize.setCurrentLanguage(langCode)
        })
    }
}
