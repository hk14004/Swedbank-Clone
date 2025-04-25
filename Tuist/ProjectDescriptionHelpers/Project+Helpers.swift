//
//  Project+Schemes.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {
    public static func appTargetScheme(name: String) -> Scheme {
        .scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: [TargetReference(stringLiteral: name)]),
            testAction: .targets([TestableTarget(stringLiteral: name)]),
            runAction: .runAction()
        )
    }
    
    public static func uiTestsScheme(name: String) -> Scheme {
        .scheme(
            name: name,
                   shared: true,
                   buildAction: .buildAction(targets: [TargetReference(stringLiteral: name)]),
                   testAction: .targets([TestableTarget(stringLiteral: name)]),
            runAction: .runAction()
        )
    }
    
    public static func makeInfoPlist(
        displayName: String,
        isProductionEnvironment: Bool,
        allowArbitaryLoads: Bool,
        appURLScheme: String?
    ) -> [String: ProjectDescription.Plist.Value] {
        let infoPlist: [String : ProjectDescription.Plist.Value] = [
            "CFBundleShortVersionString": ProjectDescription.Plist.Value(stringLiteral: makeVersionNumber(isProd: isProductionEnvironment)),
            "CFBundleVersion": ProjectDescription.Plist.Value(stringLiteral: makeBuildNumber(isProd: isProductionEnvironment)),
            "CFBundleDisplayName": ProjectDescription.Plist.Value(stringLiteral: displayName),
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
            "NSAppTransportSecurity": [
                "NSAllowArbitaryLoads": ProjectDescription.Plist.Value(booleanLiteral: allowArbitaryLoads)
            ]
        ]
        
        return infoPlist
    }
    
    static func makeVersionNumber(isProd: Bool) -> String {
        isProd ? prodVersionNumber : devVersionNumber
    }
    
    static func makeBuildNumber(isProd: Bool) -> String {
        isProd ? prodBuildNumber : prodVersionNumber
    }
    
    static func makeSettingsDictionary(identity: String, provisioningPorfileSpecifier: String, variant: Project.Root.AppVariant) -> SettingsDictionary {
        
        return SettingsDictionary().automaticCodeSigning(devTeam: variant.teamID).currentProjectVersion(makeBuildNumber(isProd: variant.isProductionEnvironment))
    }
}
