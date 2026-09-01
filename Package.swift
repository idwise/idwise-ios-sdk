// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.10

import PackageDescription

let checksumForShield = "595b5e630c5c78b0a3f740b30a0039bc3444749ae95ce5cabd9bf82f05441b31"
let checksumForFP = "6c09a037218dc8ac10233d334de4dcdc4832fbf5f057c60ee8932d30d551190f"
let checksumForIDWise = "8a09f247931037945104e63b1d41c15f91e5116a50f21a7ac85e69f4170bbaa9"

let shieldVersion = "1-5-57"
let fpVersion = "2.13.0"
let idwiseSDKVersion = "6.9.1"

let package = Package(
    name: "IDWise",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "IDWise",
            targets: ["IDWiseTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", exact: "3.3.1000")
    ],
    targets: [
        .binaryTarget(
            name: "ShieldFraud",
            url: "https://s3.amazonaws.com/cashshield-sdk/shield-ptr-ios-swift-\(shieldVersion).zip",
            checksum: checksumForShield
        ),
        .binaryTarget(
            name: "FingerprintPro",
            url: "https://fpjs-public.s3.amazonaws.com/ios/\(fpVersion)/FingerprintPro-\(fpVersion)-\(checksumForFP).xcframework.zip",
            checksum: checksumForFP
        ),
        .binaryTarget(
            name: "IDWiseSDK",
            url: "https://mobile-sdk.idwise.ai/ios/\(idwiseSDKVersion)/IDWiseSDK.xcframework.zip",
            checksum: checksumForIDWise
        ),

        // Wrapper Target to Link Dependencies
        .target(
            name: "IDWiseTarget",
            dependencies: [
                "IDWiseSDK",
                "FingerprintPro",
                "ShieldFraud",
                .product(name: "OpenSSL", package: "OpenSSL")
            ],
            path: "Sources/IDWiseTarget"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
