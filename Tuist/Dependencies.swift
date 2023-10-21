//
//  Dependencies.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: CarthageDependencies([]),
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/hk14004/DevTools-Swift", requirement: .branch("dev")),
            .remote(url: "https://github.com/Swinject/Swinject", requirement: .upToNextMajor(from: "2.0.0")),
            .remote(url: "https://github.com/kishikawakatsumi/KeychainAccess", requirement: .upToNextMajor(from: "4.2.2")),
            .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.6.0")),
        ],
        productTypes: [
            Project.Dependencies.SnapKit.rawValue: .framework,
            Project.Dependencies.Swinject.rawValue: .framework,
            Project.Dependencies.KeychainAccess.rawValue: .framework,
            Project.Dependencies.DevToolsCore.rawValue: .framework,
            Project.Dependencies.DevToolsUI.rawValue: .framework,
            Project.Dependencies.DevToolsNavigation.rawValue: .framework,
            Project.Dependencies.DevToolsNetworking.rawValue: .framework,
            Project.Dependencies.DevToolsCoreData.rawValue: .framework,
            Project.Dependencies.DevToolsLocalization.rawValue: .framework
        ]
    ),
    platforms: [.iOS])
