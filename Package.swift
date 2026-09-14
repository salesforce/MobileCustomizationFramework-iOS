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
        .package(url: "https://github.com/salesforce/SharedUI-iOS.git", from: "1.6.2"),
        .package(url: "https://github.com/forcedotcom/SalesforceMobileInterfaces-iOS.git", from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileCustomizationFramework",
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.20/MobileCustomizationFramework.xcframework.zip",
            checksum: "5f68338afd2e78b3137f5ac8921a4b602a471e6cc1b01f441df90968fbd58f9a"
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
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.20/MobileCustomizationHXL.xcframework.zip",
            checksum: "a1d61637532e4b331520abca1843ab92a87d7fe2edc5f11aeadad6f01e33622a"
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
