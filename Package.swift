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
        .package(url: "https://github.com/salesforce/SharedUI-iOS.git", from: "1.6.10"),
        .package(url: "https://github.com/forcedotcom/SalesforceMobileInterfaces-iOS.git", from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileCustomizationFramework",
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.33/MobileCustomizationFramework.xcframework.zip",
            checksum: "390938490968d3c4674f70050a36ab95d5c19de79cffcfd7e2d8f42ff8342903"
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
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.33/MobileCustomizationHXL.xcframework.zip",
            checksum: "04c52885829c4d8747fcd374238e997ddb995355ff2d476d907d564060d0507b"
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
