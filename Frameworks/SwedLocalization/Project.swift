//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = "baltic.swed.mob..\(Project.Framework.SwedLocalization.rawValue)"
}

let project = Project(
    name: Project.Framework.SwedLocalization.rawValue,
    organizationName: Project.Root.orgName,
    settings: Settings.settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        .target(
            name: Project.Framework.SwedLocalization.rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: Constants.bundleId,
            deploymentTargets: .iOS(Project.Root.targetVersion),
            resources: [
                "Resources/**"
            ],
            dependencies: [
                .external(name: Project.Dependencies.DevToolsLocalization.rawValue)
            ])
    ],
    schemes: [
        Project.appTargetScheme(name: Project.Framework.SwedLocalization.getTestTargetName())
    ]
)


//dependencies: [
//  .external(name: "DevToolsCore"),
//  .project(target: "SwedApplicationBusinessRules", path: "../SwedApplicationBusinessRules")
//])
