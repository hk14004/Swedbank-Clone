//
//  Project+Frameworks.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {
    public static func makeFrameworkSettingsDictionary(targetName: String) -> SettingsDictionary {
         [
            "APPLICATION_EXTENSION_API_ONLY": SettingValue(booleanLiteral: false),
            "SKIP_INSTALL": SettingValue(booleanLiteral: true),
         ]
    }
}
