//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

private func currentFramework() -> Project.Framework {
    .SwedPersistance
}

let project = Project(
    name: currentFramework().rawValue,
    organizationName: Project.Root.orgName,
    settings: Settings.settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        .target(
            name: currentFramework().rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: currentFramework().getBundleID(),
            deploymentTargets: .iOS(Project.Root.targetVersion),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: Project.Dependencies.DevToolsLocalization.rawValue),
                .project(target: Project.Framework.SwedLocalization.rawValue, path: "../\(Project.Framework.SwedLocalization.rawValue)"),
                .project(target: Project.Framework.SwedApplication.rawValue, path: "../\(Project.Framework.SwedApplication.rawValue)")
            ]
        ),
        .target(
            name: currentFramework().getTestTargetName(),
            destinations: .iOS,
            product: .unitTests,
            bundleId: currentFramework().getTestBundleID(),
            deploymentTargets: .iOS(Project.Root.targetVersion),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: currentFramework().rawValue),
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        )
    ],
    schemes: [
        Project.appTargetScheme(name: currentFramework().getTestTargetName())
    ]
)
