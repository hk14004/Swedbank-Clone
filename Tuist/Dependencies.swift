//
//  Dependencies.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

let dependencies = Dependencies(
    carthage: CarthageDependencies([]),
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/hk14004/DevTools-Swift", requirement: .branch("dev")),
            .remote(url: "https://github.com/Swinject/Swinject", requirement: .upToNextMajor(from: "2.0.0")),
            .remote(url: "https://github.com/kishikawakatsumi/KeychainAccess", requirement: .upToNextMajor(from: "4.2.2")),
        ],
        productTypes: ["Swinject": .framework,
                       "KeychainAccess": .framework,
                       "DevToolsUI": .framework,
                       "DevToolsNavigation": .framework,
                       "DevToolsNetworking": .framework,
                       "DevToolsCoreData": .framework,
                       "DevToolsLocalization": .framework
                      ]
    ),
    platforms: [.iOS])
