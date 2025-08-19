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
        case Application
        case Enterprise
        case Localization
        case SwedNetwork
    }
}

public extension Project.Framework {
    func getPath() -> Path {
        "\(Project.frameworkDir + "/" + rawValue)"
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
