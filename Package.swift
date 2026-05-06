// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.10

import PackageDescription

let checksumForShield = "595b5e630c5c78b0a3f740b30a0039bc3444749ae95ce5cabd9bf82f05441b31"
let checksumForFP = "6c09a037218dc8ac10233d334de4dcdc4832fbf5f057c60ee8932d30d551190f"
let checksumForIDWise = "fb78ca29b07c94ba1eaa1dc694accfc6e4141f7dcb81cc97a4abdba91aad593a"

let shieldVersion = "1-5-57"
let fpVersion = "2.13.0"
let idwiseSDKVersion = "6.6.3"

let package = Package(
    name: "IDWise",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "IDWise",
            targets: ["IDWise","ShieldFraud","FingerprintPro"]
        )
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
            name: "IDWise",
            url: "https://mobile-sdk.idwise.ai/ios/\(idwiseSDKVersion)/IDWiseSDK.xcframework.zip",
            checksum: checksumForIDWise
        ),
    ],
    swiftLanguageVersions: [.v5]
)
