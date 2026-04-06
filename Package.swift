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
    ],
    dependencies: [
        .package(url: "https://github.com/salesforce/SLDSIcons-iOS.git", from: "1.2.0"),
        .package(url: "https://github.com/salesforce/SharedUI-iOS.git", from: "1.2.0"),
        .package(url: "https://github.com/forcedotcom/SalesforceMobileInterfaces-iOS.git", from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileCustomizationFramework",
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.1.4/MobileCustomizationFramework.xcframework.zip",
            checksum: "964978a88aa77af6361587d17db88ff9fd79bff0713b58a771df946990e2e489"
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
    ],
    swiftLanguageVersions: [.v5]
)
