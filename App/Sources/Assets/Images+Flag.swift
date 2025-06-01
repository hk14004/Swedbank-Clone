//
//  Images+Flag.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

extension AppImages {
    static func makeLanguageFlagName(language: String) -> String {
        let prefix = "ic_"
        let suffix = "_flag"
        return prefix + language + suffix
    }
}
