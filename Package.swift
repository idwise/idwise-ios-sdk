// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let checksumForFP = "cdceb6f13d2302bfdbf95f26d013264c678058ffbf1226034aaa0be1763d796b"
let checksumForIDWise = "f4f81c1efab87d2e3593aca7c5b8b42498feaa8dc2219b3d9902c19948abd35d"

let fpVersion = "2.7.0"
let idwiseSDKVersion = "5.4.0"

let package = Package(
    name: "IDWise",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "IDWise",
            targets: ["IDWise","FingerprintPro"]
        )
    ],
    targets: [
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
