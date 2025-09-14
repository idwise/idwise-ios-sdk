// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let checksumForShield = "a9d35093ea951d83b818715e3b9e2dae7928d1c42961c1e169d142bca57e6682"
let checksumForFP = "cdceb6f13d2302bfdbf95f26d013264c678058ffbf1226034aaa0be1763d796b"
let checksumForIDWise = "87937023657eebc614c8eca5eef199a39be12db4a48af87412c8daf7260085e9"

let shieldVersion = "1-5-50"
let fpVersion = "2.7.0"
let idwiseSDKVersion = "5.7.2"

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
