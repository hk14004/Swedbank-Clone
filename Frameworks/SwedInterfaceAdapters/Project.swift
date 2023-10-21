//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

let project = Project(
    name: "SwedInterfaceAdapters",
    organizationName: Project.Root.orgName,
    targets: [
        Target(name: "SwedInterfaceAdapters",
               platform: .iOS,
               product: .framework,
               bundleId: "com.hardijs.SwedInterfaceAdapters",
               deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: [.iphone, .ipad]),
               sources: ["Sources/**"],
               dependencies: [
                 .external(name: "DevToolsCore"),
                 .project(target: "SwedApplicationBusinessRules", path: "../SwedApplicationBusinessRules")
               ])
    ]
)
