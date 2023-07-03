//
//  Project+Schemes.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {
    public static func appTargetScheme(name: String, testPlans: [Path] = []) -> Scheme {
        Scheme(name: name,
               shared: true,
               buildAction: .buildAction(targets: [TargetReference(stringLiteral: name)]),
               testAction: .testPlans(testPlans),
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
}
