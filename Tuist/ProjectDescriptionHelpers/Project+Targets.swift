//
//  Project+Targets.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {
    public static var allTargets: [ProjectDescription.Target] {
        return appTargets
    }
}

extension Project {
    private static func makeInfoPlist(displayName: String, isProductionEnvironment: Bool, allowArbitaryLoads: Bool, appURLScheme: String?) -> [String: InfoPlist.Value] {
        let infoPlist: [String : InfoPlist.Value] = [
            "CFBundleShortVersionString": InfoPlist.Value(stringLiteral: makeVersionNumber(isProd: isProductionEnvironment)),
            "CFBundleVersion": InfoPlist.Value(stringLiteral: makeBuildNumber(isProd: isProductionEnvironment)),
            "CFBundleDisplayName": InfoPlist.Value(stringLiteral: displayName),
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
            "NSAppTransportSecurity": [
                "NSAllowArbitaryLoads": InfoPlist.Value(booleanLiteral: allowArbitaryLoads)
            ]
        ]
        
        return infoPlist
    }
    
    private static func makeVersionNumber(isProd: Bool) -> String {
        isProd ? prodVersionNumber : devVersionNumber
    }
    
    private static func makeBuildNumber(isProd: Bool) -> String {
        isProd ? prodBuildNumber : prodVersionNumber
    }
    
    private static func makeSettingsDictionary(identity: String, provisioningPorfileSpecifier: String, variant: Variant) -> SettingsDictionary {
        
        return SettingsDictionary().automaticCodeSigning(devTeam: variant.teamID).currentProjectVersion(makeBuildNumber(isProd: variant.isProductionEnvironment))
    }
    
    private static var appTargets: [Target] {
        variants.map {
            Target(name: $0.targetName,
                   platform: .iOS,
                   product: .app,
                   productName: $0.productName,
                   bundleId: $0.bundleID,
                   deploymentTarget: .iOS(targetVersion: Project.Root.targetVersion, devices: [.iphone, .ipad]),
                   infoPlist: .extendingDefault(with: makeInfoPlist(displayName: $0.displayName,
                                                                    isProductionEnvironment: $0.isProductionEnvironment,
                                                                    allowArbitaryLoads: $0.allowArbitaryLoads,
                                                                    appURLScheme: $0.appURLScheme)),
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
                    .debug(name: .debug, settings: makeSettingsDictionary(identity: "iPhone Developer", provisioningPorfileSpecifier: "", variant: $0)),
                    .release(name: .release, settings: makeSettingsDictionary(identity: "iPhone Developer", provisioningPorfileSpecifier: "", variant: $0))
                   ])
            )
        }
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
                   dependencies: [.target(name: variant.targetName)])
        ]
    }
}
