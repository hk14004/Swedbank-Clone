//
//  Project+Constants.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {
    public struct Root {
        public static let name = "Swedbank"
        public static let orgName = "SWEDBANK AB"
        public static let targetVersion = "17.0"
        public static let devices: DeploymentDevice = [.iphone, .ipad]
    }
}
