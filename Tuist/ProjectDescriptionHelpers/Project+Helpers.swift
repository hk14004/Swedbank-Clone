//
//  Project+Schemes.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {    
    public static func appTargetScheme(name: String) -> Scheme {
        Scheme(name: name,
               shared: true,
               buildAction: .buildAction(targets: [TargetReference(stringLiteral: name)]),
               testAction: .targets([TestableTarget(stringLiteral: name)]),
               runAction: .runAction()
        )
    }
    
    public static func uiTestsScheme(name: String) -> Scheme {
        Scheme(name: name,
               shared: true,
               buildAction: .buildAction(targets: [TargetReference(stringLiteral: name)]),
               testAction: .targets([TestableTarget(stringLiteral: name)]),
               runAction: .runAction(arguments: Arguments(
                environment: [
                    :
                ]))
        )
    }
    
    public static func makeInfoPlist(displayName: String, isProductionEnvironment: Bool, allowArbitaryLoads: Bool, appURLScheme: String?) -> [String: InfoPlist.Value] {
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
