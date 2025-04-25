//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = "com.hardijs.\(Project.Framework.SwedApplicationBusinessRules.rawValue)"
}

let project = Project(
    name: Project.Framework.SwedApplicationBusinessRules.rawValue,
    organizationName: Project.Root.orgName,
    settings: Settings.settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        .target(
            name: Project.Framework.SwedApplicationBusinessRules.rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: Constants.bundleId,
            deploymentTargets: .iOS(Project.Root.targetVersion),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        ),
        .target(
            name: Project.Framework.SwedApplicationBusinessRules.getTestTargetName(),
            destinations: .iOS,
            product: .unitTests,
            bundleId: Constants.bundleId + ".test",
            deploymentTargets: .iOS(Project.Root.targetVersion),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: Project.Framework.SwedApplicationBusinessRules.rawValue),
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        )
    ],
    schemes: [
        Project.appTargetScheme(name: Project.Framework.SwedApplicationBusinessRules.getTestTargetName())
    ]
)
