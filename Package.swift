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
        .package(url: "https://github.com/salesforce/SLDSIcons-iOS.git", from: "1.2.5"),
        .package(url: "https://github.com/salesforce/SharedUI-iOS.git", from: "1.5.6"),
        .package(url: "https://github.com/forcedotcom/SalesforceMobileInterfaces-iOS.git", from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileCustomizationFramework",
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.3/MobileCustomizationFramework.xcframework.zip",
            checksum: "5befb326880383b6563259bbfd9b17a25575dd8dcf605658e10d9bdf4a13245f"
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
            url: "https://github.com/salesforce/MobileCustomizationFramework-iOS/releases/download/6.5.3/MobileCustomizationHXL.xcframework.zip",
            checksum: "e1fae64d73ed988e82f797fe5c464394fa46b9f1341f6b9c13901f3ecff5cba1"
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
