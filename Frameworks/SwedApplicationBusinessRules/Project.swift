//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

let project = Project(
    name: "SwedApplicationBusinessRules",
    organizationName: Project.Constants.orgName,
    targets: [
        Target(name: "SwedApplicationBusinessRules",
               platform: .iOS,
               product: .framework,
               bundleId: "com.hardijs.SwedApplicationBusinessRules",
               deploymentTarget: .iOS(targetVersion: Project.Constants.targetVersion, devices: [.iphone, .ipad]),
               sources: ["Sources/**"],
               dependencies: [
                 .external(name: "DevToolsCore")
               ])
    ]
)
