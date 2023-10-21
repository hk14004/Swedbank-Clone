//
//  Project+Targets.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project.Root {
    public static var allTargets: [ProjectDescription.Target] {
        return appTargets
    }
    
    private static var appTargets: [Target] {
        variants.map { $0.toTuistTarget() }
    }
    
    private static var appUnitTestTargets: [Target] {
        let variant = variants[1]
        return [
            Target(name: "Swedbank Unit Tests",
                   platform: .iOS,
                   product: .unitTests,
                   bundleId: "\(variant.bundleID).unittest",
                   deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: [.iphone, .ipad]),
                   infoPlist: .default,
                   sources: ["App/Tests/Unit/**"],
                   dependencies: [.target(name: variant.name)])
        ]
    }
}

extension Project.Root {
    public static let variants: [AppVariant] = [
        AppVariant(name: "SWEDBANK LV",
            productName: "SWEDBANK",
            displayName: "Swed Latvija",
            bundleID: "com.hardijs.swedbank",
            configsSubdirectoryName: "",
            resourcesSubdirectoryName: "",
            teamID: "9FVL8NV4N7",
            debugProvisioningProfile: "",
            releaseProvisioningProfile: "",
            isProductionEnvironment: true,
            shouldSignWithDistributionCertificate: false,
            allowArbitaryLoads: false,
            appURLScheme: nil
           ),
        AppVariant(name: "SWEDBANK LV Dev",
            productName: "SWEDBANK",
            displayName: "Swed Latvija Dev",
            bundleID: "com.hardijs.swedbank.dev",
            configsSubdirectoryName: "",
            resourcesSubdirectoryName: "",
            teamID: "9FVL8NV4N7",
            debugProvisioningProfile: "",
            releaseProvisioningProfile: "",
            isProductionEnvironment: false,
            shouldSignWithDistributionCertificate: false,
            allowArbitaryLoads: true,
            appURLScheme: nil
           ),
    ]
}
