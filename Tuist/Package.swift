// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [
            "SwiftyUserDefaults": .framework,
            "SnapKit": .framework,
            "Swinject": .framework,
            "KeychainAccess": .framework,
            "DevToolsCore": .framework,
            "DevToolsUI": .framework,
            "DevToolsNavigation": .framework,
            "DevToolsNetworking": .framework,
            "DevToolsPersistance": .framework,
            "DevToolsLocalization": .framework
        ]
    )
#endif

let package = Package(
    name: "Dependencies",
    dependencies: [
        .package(url: "https://github.com/hk14004/DevTools-Swift", branch: "main"),
        .package(url: "https://github.com/Swinject/Swinject", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", .upToNextMajor(from: "4.2.2")),
        .package(url: "https://github.com/SnapKit/SnapKit", .upToNextMajor(from: "5.6.0")),
        .package(url: "https://github.com/sunshinejr/SwiftyUserDefaults", .upToNextMajor(from: "5.3.0")),
    ]
)
