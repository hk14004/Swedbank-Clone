//
//  Dependencies.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

public extension Dependencies {
    enum Constants: String {
        case SnapKit
        case Swinject
        case KeychainAccess
        case DevToolsCore
        case DevToolsUI
        case DevToolsNavigation
        case DevToolsNetworking
        case DevToolsCoreData
        case DevToolsLocalization
    }
}
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
            Dependencies.Constants.SnapKit.rawValue: .framework,
            Dependencies.Constants.Swinject.rawValue: .framework,
            Dependencies.Constants.KeychainAccess.rawValue: .framework,
            Dependencies.Constants.DevToolsCore.rawValue: .framework,
            Dependencies.Constants.DevToolsUI.rawValue: .framework,
            Dependencies.Constants.DevToolsNavigation.rawValue: .framework,
            Dependencies.Constants.DevToolsNetworking.rawValue: .framework,
            Dependencies.Constants.DevToolsCoreData.rawValue: .framework,
            Dependencies.Constants.DevToolsLocalization.rawValue: .framework
        ]
    ),
    platforms: [.iOS])
