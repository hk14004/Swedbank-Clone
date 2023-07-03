//
//  Project+Variants.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {
    public struct Variant {
        public let targetName: String
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

extension Project {
    public static let variants: [Variant] = [
    Variant(targetName: "SWED LV",
            productName: "SWED",
            displayName: "Swedbank clone",
            bundleID: "com.hardijs.Swedbank-Clone",
            configsSubdirectoryName: "",
            resourcesSubdirectoryName: "",
            teamID: "9FVL8NV4N7",
            debugProvisioningProfile: "",
            releaseProvisioningProfile: "",
            isProductionEnvironment: false,
            shouldSignWithDistributionCertificate: true,
            allowArbitaryLoads: true,
            appURLScheme: nil)
    ]
}
