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
        ],
        productTypes: ["Swinject": .framework]
    ),
    platforms: [.iOS])
