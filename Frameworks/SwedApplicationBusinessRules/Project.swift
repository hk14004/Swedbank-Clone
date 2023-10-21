//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

let project = Project(
    name: Project.Framework.SwedApplicationBusinessRules.rawValue,
    organizationName: Project.Root.orgName,
    targets: [
        Target(name: Project.Framework.SwedApplicationBusinessRules.rawValue,
               platform: .iOS,
               product: .framework,
               bundleId: "com.hardijs.\(Project.Framework.SwedApplicationBusinessRules.rawValue)",
               deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: Project.Root.devices),
               sources: ["Sources/**"],
               dependencies: [
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
               ])
    ]
)
