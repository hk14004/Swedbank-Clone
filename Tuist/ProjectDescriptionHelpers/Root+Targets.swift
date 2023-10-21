//
//  Project+Targets.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project.Root {
    public static var allTargets: [Target] {
        return appTargets + appUnitTestTargets
    }
    
    private static var appTargets: [Target] {
        appVariants.map { $0.toTuistTarget() }
    }
    
    private static var appUnitTestTargets: [Target] {
        let variant = appVariants[1]
        return [
            Target(
                name: "App Unit Tests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "\(variant.bundleID).test",
                deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: Project.Root.devices),
                infoPlist: .default,
                sources: ["App/UnitTests/**"],
                dependencies: [.target(name: variant.name)]
            )
        ]
    }
    
    public static let appVariants: [AppVariant] = [
        AppVariant(
            name: "SWEDBANK LV",
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
        AppVariant(
            name: "SWEDBANK LV Dev",
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
        )
    ]
}
