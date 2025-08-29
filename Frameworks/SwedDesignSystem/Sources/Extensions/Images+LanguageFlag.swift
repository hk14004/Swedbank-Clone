//
//  Images+LanguageFlag.swift
//  SwedDesignSystem
//
//  Created by Hardijs on 19/08/2025.
//  Copyright © 2025 Swedbank. All rights reserved.
//

import Foundation

public extension SwedDesignSystemAsset.Images {
    static func makeLanguageFlagName(language: String) -> String {
        let prefix = "ic_"
        let suffix = "_flag"
        return prefix + language + suffix
    }
}
