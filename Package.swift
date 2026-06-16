// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.10

import PackageDescription

let checksumForShield = "595b5e630c5c78b0a3f740b30a0039bc3444749ae95ce5cabd9bf82f05441b31"
let checksumForFP = "6c09a037218dc8ac10233d334de4dcdc4832fbf5f057c60ee8932d30d551190f"
let checksumForIDWise = "f6d627b5b6e4357e500e8764cb137da67e54b4c3dbebc7b7e2d8a23b3ff19d13"

let shieldVersion = "1-5-57"
let fpVersion = "2.13.0"
let idwiseSDKVersion = "6.8.0"

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
