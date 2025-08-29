//
//  Project+Frameworks.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 21/10/2023.
//

import ProjectDescription

public extension Project {
    static let frameworkDir = "Frameworks"
    enum Framework: String {
        case SwedApplication
        case SwedEnterprise
        case SwedLocalization
        case SwedNetwork
        case SwedDesignSystem
        case SwedData
        case SwedPersistance
        case SwedUtils
        // Features
        case SwedOverview
        case SwedLogin
        case SwedContacts
    }
}

public extension Project.Framework {
    func getPath() -> Path {
        switch self {
        case .SwedOverview, .SwedLogin, .SwedContacts:
            "\(Project.frameworkDir + "/" + "Features" + "/" + rawValue)"
        default:
            "\(Project.frameworkDir + "/" + rawValue)"
        }
    }
    
    func getTestTargetName() -> String {
        rawValue + "Test"
    }
    
    func getBundleID() -> String {
        Project.Root.bundleIdPrefix + rawValue
    }
    
    func getTestBundleID() -> String {
        getBundleID() + ".test"
    }
}
