// swift-tools-version: 5.9

//
//  Package.swift
//  MobileCustomizationFramework
//
//  Copyright (c) 2026, Salesforce, Inc.,
//  All rights reserved.
//  For full license text, see the TERMS_OF_USE.txt file
//

import PackageDescription

let package = Package(
    name: "MobileCustomizationFramework",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "MobileCustomizationFramework",
            targets: ["MobileCustomizationFrameworkTarget"]
        ),
        .library(
            name: "MobileCustomizationHXL",
            targets: ["MobileCustomizationHXLTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/salesforce/SLDSIcons-iOS.git", from: "1.2.7"),
        .package(url: "https://github.com/salesforce/SharedUI-iOS.git", from: "1.7.8"),
        .package(url: "https://github.com/forcedotcom/SalesforceMobileInterfaces-iOS.git", from: "1.1.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileCustomizationFramework",
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.53/MobileCustomizationFramework.xcframework.zip",
            checksum: "31fe9578168bb264a393c655e3e3d0e683e7d5c3fdd1ba35a152f18fcf868bf4"
        ),
        .target(
            name: "MobileCustomizationFrameworkTarget",
            dependencies: [
                "MobileCustomizationFramework",
                .product(name: "SLDSIcons", package: "SLDSIcons-iOS"),
                .product(name: "SharedUI", package: "SharedUI-iOS"),
                .product(name: "SalesforceNetwork", package: "SalesforceMobileInterfaces-iOS"),
                .product(name: "SalesforceLogging", package: "SalesforceMobileInterfaces-iOS"),
                .product(name: "SalesforceUser", package: "SalesforceMobileInterfaces-iOS"),
                .product(name: "SalesforceNavigation", package: "SalesforceMobileInterfaces-iOS"),
                .product(name: "SalesforceCache", package: "SalesforceMobileInterfaces-iOS"),
            ],
            path: "Sources/MobileCustomizationFrameworkTarget"
        ),
        .binaryTarget(
            name: "MobileCustomizationHXL",
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.53/MobileCustomizationHXL.xcframework.zip",
            checksum: "b6953588efe969813035854b8faef6cb26d92dde516de0467bf896174bd9ca1d"
        ),
        .target(
            name: "MobileCustomizationHXLTarget",
            dependencies: [
                "MobileCustomizationHXL",
                "MobileCustomizationFrameworkTarget",
            ],
            path: "Sources/MobileCustomizationHXLTarget"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
