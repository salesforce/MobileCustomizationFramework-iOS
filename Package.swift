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
        .package(url: "https://github.com/salesforce/SharedUI-iOS.git", from: "1.6.14"),
        .package(url: "https://github.com/forcedotcom/SalesforceMobileInterfaces-iOS.git", from: "1.1.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileCustomizationFramework",
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.41/MobileCustomizationFramework.xcframework.zip",
            checksum: "05fbb6833f2b70a5aa3d90bd721c142166f267e2ff0996207e94df5c2078a4b8"
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
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.41/MobileCustomizationHXL.xcframework.zip",
            checksum: "37df5c1223855a1fffd5f689f6a251f6d24dcefbc212f3bc2b33a566f60b026c"
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
