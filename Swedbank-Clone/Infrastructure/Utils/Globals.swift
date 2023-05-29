//
//  Globals.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import Foundation

class Globals {
    
}

extension Globals {
    static func makeLanguageFlagName(language: String) -> String {
        let prefix = "ic_"
        let suffix = "_flag"
        return prefix + language + suffix
    }
    
    static func makeLanguageNameKey(language: String) -> String {
        return "LanguageSelection." + language
    }
}
