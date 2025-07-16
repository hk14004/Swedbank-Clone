//
//  Project+Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 21/10/2023.
//

import ProjectDescription

public extension Project {
    enum Dependencies: String {
        case SwiftyUserDefaults
        case SnapKit
        case Swinject
        case KeychainAccess
        case DevToolsCore
        case DevToolsUI
        case DevToolsNavigation
        case DevToolsNetworking
        case DevToolsPersistance
        case DevToolsLocalization
    }
}
