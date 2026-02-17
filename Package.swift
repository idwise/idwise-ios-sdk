// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.10

import PackageDescription

let checksumForShield = "3f80bef16ebda425b53a8e9f2e7d4a3ce9b027d8dbcccd057605acca8c3bef83"
let checksumForFP = "bc66d7912a0a162c1082381f0f0550e3afaa3d267d805e6a2159ccc0f8f247dd"
let checksumForIDWise = "94552992e067881d2826b3afcd6797ce41370ec22da94cff3dedfff751863461"

let shieldVersion = "1-5-52"
let fpVersion = "2.12.0"
let idwiseSDKVersion = "6.2.3"

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
