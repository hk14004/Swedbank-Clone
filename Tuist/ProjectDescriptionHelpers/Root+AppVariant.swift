//
//  Project+Variants.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project.Root {
    public struct AppVariant {
        public let name: String
        public let productName: String
        public let displayName: String
        public let bundleID: String
        public let configsSubdirectoryName: String
        public let resourcesSubdirectoryName: String
        public let teamID: String
        public let debugProvisioningProfile: String
        public let releaseProvisioningProfile: String
        public let isProductionEnvironment: Bool
        public let shouldSignWithDistributionCertificate: Bool
        public let allowArbitaryLoads: Bool
        public let appURLScheme: String?
    }
}

extension Project.Root.AppVariant {
    func toTuistTarget() -> Target {
        Target(name: name,
               platform: .iOS,
               product: .app,
               productName: productName,
               bundleId: bundleID,
               deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: Project.Root.devices),
               infoPlist: .extendingDefault(
                with: Project.makeInfoPlist(
                    displayName: displayName,
                    isProductionEnvironment: isProductionEnvironment,
                    allowArbitaryLoads: allowArbitaryLoads,
                    appURLScheme: appURLScheme
                )
               ),
               sources: [
                .glob("App/Sources/**")
               ],
               resources: [
                "App/Resources/**"
               ],
               entitlements: nil,
               scripts: [],
               dependencies: [
                .project(target: "SwedInterfaceAdapters", path: "Frameworks/SwedInterfaceAdapters"),
                .project(target: "SwedEnterpriseBusinessRules", path: "Frameworks/SwedEnterpriseBusinessRules"),
                .project(target: "SwedApplicationBusinessRules", path: "Frameworks/SwedApplicationBusinessRules"),
                .external(name: "SnapKit"),
                .external(name: "Swinject"),
                .external(name: "KeychainAccess"),
                .external(name: "DevToolsUI"),
                .external(name: "DevToolsNavigation"),
                .external(name: "DevToolsNetworking"),
                .external(name: "DevToolsCoreData"),
                .external(name: "DevToolsLocalization")
               ],
               settings: .settings(configurations: [
                .debug(name: .debug, settings: Project.makeSettingsDictionary(identity: "iPhone Developer", provisioningPorfileSpecifier: "", variant: self)),
                .release(name: .release, settings: Project.makeSettingsDictionary(identity: "iPhone Developer", provisioningPorfileSpecifier: "", variant: self))
               ])
        )
    }
}
