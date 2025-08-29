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
        .target(
            name: name,
            destinations: .iOS,
            product: .app,
            productName: productName,
            bundleId: bundleID,
            deploymentTargets: .iOS(Project.Root.targetVersion),
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
                .project(
                    target: Project.Framework.SwedEnterprise.rawValue,
                    path: Project.Framework.SwedEnterprise.getPath()
                ),
                .project(
                    target: Project.Framework.SwedApplication.rawValue,
                    path: Project.Framework.SwedApplication.getPath()
                ),
                .project(
                    target: Project.Framework.SwedPersistance.rawValue,
                    path: Project.Framework.SwedPersistance.getPath()
                ),
                .project(
                    target: Project.Framework.SwedData.rawValue,
                    path: Project.Framework.SwedData.getPath()
                ),
                .project(
                    target: Project.Framework.SwedNetwork.rawValue,
                    path: Project.Framework.SwedNetwork.getPath()
                ),
                .project(
                    target: Project.Framework.SwedDesignSystem.rawValue,
                    path: Project.Framework.SwedDesignSystem.getPath()
                ),
                .project(
                    target: Project.Framework.SwedLocalization.rawValue,
                    path: Project.Framework.SwedLocalization.getPath()
                ),
                .project(
                    target: Project.Framework.SwedOverview.rawValue,
                    path: Project.Framework.SwedOverview.getPath()
                ),
                .project(
                    target: Project.Framework.SwedLogin.rawValue,
                    path: Project.Framework.SwedLogin.getPath()
                ),
                .project(
                    target: Project.Framework.SwedContacts.rawValue,
                    path: Project.Framework.SwedContacts.getPath()
                ),
                .project(
                    target: Project.Framework.SwedUtils.rawValue,
                    path: Project.Framework.SwedUtils.getPath()
                ),
                .external(name: Project.Dependencies.SwiftyUserDefaults.rawValue),
                .external(name: Project.Dependencies.SnapKit.rawValue),
                .external(name: Project.Dependencies.Swinject.rawValue),
                .external(name: Project.Dependencies.KeychainAccess.rawValue),
                .external(name: Project.Dependencies.DevToolsUI.rawValue),
                .external(name: Project.Dependencies.DevToolsNavigation.rawValue),
                .external(name: Project.Dependencies.DevToolsNetworking.rawValue),
                .external(name: Project.Dependencies.DevToolsPersistance.rawValue),
                .external(name: Project.Dependencies.DevToolsLocalization.rawValue)
            ],
            settings: .settings(configurations: [
                .debug(name: .debug, settings: Project.makeSettingsDictionary(
                    identity: "iPhone Developer",
                    provisioningPorfileSpecifier: "", variant: self)
                ),
                .release(name: .release, settings: Project.makeSettingsDictionary(
                    identity: "iPhone Developer", provisioningPorfileSpecifier: "", variant: self)
                )
            ])
        )
    }
}
