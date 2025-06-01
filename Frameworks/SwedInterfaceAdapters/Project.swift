//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = "baltic.swed.mob.\(Project.Framework.SwedInterfaceAdapters.rawValue)"
}

let project = Project(
    name: Project.Framework.SwedInterfaceAdapters.rawValue,
    organizationName: Project.Root.orgName,
    settings: Settings.settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        .target(
            name: Project.Framework.SwedInterfaceAdapters.rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: Constants.bundleId,
            deploymentTargets: .iOS(Project.Root.targetVersion),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: Project.Dependencies.DevToolsCore.rawValue),
                .project(target: Project.Framework.SwedApplicationBusinessRules.rawValue, path: "../\(Project.Framework.SwedApplicationBusinessRules.rawValue)"),
                .project(target: Project.Framework.SwedLocalization.rawValue, path: "../\(Project.Framework.SwedLocalization.rawValue)")
            ]),
        .target(
            name: Project.Framework.SwedInterfaceAdapters.getTestTargetName(),
            destinations: .iOS,
            product: .unitTests,
            bundleId: Constants.bundleId + ".test",
            deploymentTargets: .iOS(Project.Root.targetVersion),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: Project.Framework.SwedInterfaceAdapters.rawValue),
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        )
    ],
    schemes: [
        Project.appTargetScheme(name: Project.Framework.SwedInterfaceAdapters.getTestTargetName())
    ]
)


//dependencies: [
//  .external(name: "DevToolsCore"),
//  .project(target: "SwedApplicationBusinessRules", path: "../SwedApplicationBusinessRules")
//])
