//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = "baltic.swed.mob.\(Project.Framework.SwedApplicationBusinessRules.rawValue)"
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
                .project(target: Project.Framework.SwedEnterpriseBusinessRules.rawValue, path: "../\(Project.Framework.SwedEnterpriseBusinessRules.rawValue)"),
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
