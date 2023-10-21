//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = "com.hardijs.\(Project.Framework.SwedInterfaceAdapters.rawValue)"
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
        Target(name: Project.Framework.SwedInterfaceAdapters.rawValue,
               platform: .iOS,
               product: .framework,
               bundleId: Constants.bundleId,
               deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: Project.Root.devices),
               sources: ["Sources/**"],
               dependencies: [
                .external(name: Project.Dependencies.DevToolsCore.rawValue),
                .project(target: Project.Framework.SwedApplicationBusinessRules.rawValue, path: "../\(Project.Framework.SwedApplicationBusinessRules.rawValue)")
               ]),
        Target(name: Project.Framework.SwedInterfaceAdapters.getTestTargetName(),
               platform: .iOS,
               product: .unitTests,
               bundleId: Constants.bundleId + ".test",
               deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: Project.Root.devices),
               infoPlist: .default,
               sources: ["Tests/**"],
               dependencies: [
                .target(name: Project.Framework.SwedInterfaceAdapters.rawValue),
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
               ])
    ],
    schemes: [
        Project.appTargetScheme(name: Project.Framework.SwedInterfaceAdapters.getTestTargetName())
    ]
)


//dependencies: [
//  .external(name: "DevToolsCore"),
//  .project(target: "SwedApplicationBusinessRules", path: "../SwedApplicationBusinessRules")
//])
