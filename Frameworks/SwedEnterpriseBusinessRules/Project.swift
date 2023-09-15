//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

let project = Project(
    name: "SwedEnterpriseBusinessRules",
    organizationName: Project.Constants.orgName,
    targets: [
        Target(name: "SwedEnterpriseBusinessRules",
               platform: .iOS,
               product: .framework,
               bundleId: "com.hardijs.SwedEnterpriseBusinessRules",
               deploymentTarget: .iOS(targetVersion: Project.Constants.targetVersion, devices: [.iphone, .ipad]),
               sources: ["Sources/**"])
    ]
)
