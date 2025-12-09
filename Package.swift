// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let checksumForShield = "3f80bef16ebda425b53a8e9f2e7d4a3ce9b027d8dbcccd057605acca8c3bef83"
let checksumForFP = "9a9ac84b28395848247b41ce632fd00cbd309c9a99772a9ff0cf2099ef636937"
let checksumForIDWise = "5f945b6028cca5969698a186e5037a54bea90da13ad2bae9a55316a051975199"

let shieldVersion = "1-5-52"
let fpVersion = "2.11.0"
let idwiseSDKVersion = "5.8.2"

let package = Package(
    name: "IDWise",
    platforms: [
        .iOS(.v13)
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
