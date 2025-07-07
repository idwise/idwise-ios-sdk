// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let checksumForShield = "28ed6c3a69c62e19fc508176cc4401e6e282a941b0110dfed85b528e39e4a4c3"
let checksumForFP = "cdceb6f13d2302bfdbf95f26d013264c678058ffbf1226034aaa0be1763d796b"
let checksumForIDWise = "85edc99a7f5b50e671de193840122fe4c26e37297c5dee8165336df6ac8e5002"

let shieldVersion = "1-5-49"
let fpVersion = "2.7.0"
let idwiseSDKVersion = "5.5.4"

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
