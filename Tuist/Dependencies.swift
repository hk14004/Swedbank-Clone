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
        ]
//        productTypes: ["DevTools-Swift": .framework]
    ),
    platforms: [.iOS])
