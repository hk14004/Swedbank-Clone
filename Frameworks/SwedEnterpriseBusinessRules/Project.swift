//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let name = "SwedEnterpriseBusinessRules"
    static let bundleId = "com.hardijs.SwedEnterpriseBusinessRules"
    static let devices: ProjectDescription.DeploymentDevice = [.iphone, .ipad]
}

let project = Project(
    name: Constants.name,
    organizationName: Project.Constants.orgName,
    settings: Settings.settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        Target(name: Constants.name,
               platform: .iOS,
               product: .framework,
               bundleId: Constants.bundleId,
               deploymentTarget: .iOS(targetVersion: Project.Constants.targetVersion, devices: Constants.devices),
               sources: ["Sources/**"],
               dependencies: [
                .external(name: "DevToolsCore")
               ]),
        Target(name: Constants.name + "Tests",
               platform: .iOS,
               product: .unitTests,
               bundleId: Constants.bundleId + ".test",
               deploymentTarget: .iOS(targetVersion: Project.Constants.targetVersion, devices: Constants.devices),
               infoPlist: .default,
               sources: ["Tests/**"],
               dependencies: [
                .target(name: Constants.name),
                .external(name: "DevToolsCore")
               ])
    ],
    schemes: [
        Project.appTargetScheme(name: "\(Constants.name + "Tests")")
    ]
)
