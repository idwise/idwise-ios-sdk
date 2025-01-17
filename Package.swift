// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

//import PackageDescription
//
//let package = Package(
//    name: "IDWiseSDK",
//    platforms: [
//           .iOS(.v13)
//        ],
//    products: [
//        // Products define the executables and libraries a package produces, making them visible to other packages.
//        .library(
//            name: "IDWiseSDK",
//            targets: ["IDWiseSDK"])
//    ],
//    dependencies: [
//            // Dependencies declare other packages that this package depends on.
//            .package(url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios", from: "2.7.0")
//        ],
//    targets: [
//          // Targets are the basic building blocks of a package. A target can define a module or a test suite.
//          // Targets can depend on other targets in this package, and on products in packages this package depends on.
//          .binaryTarget(
//              name: "IDWiseSDK",
//              url: "https://mobile-sdk.idwise.ai/ios/5.1.6/IDWiseSDK.xcframework.zip",
//              checksum: "988aff83a10d8165cef6911c3b227040ecf87768bf90d003b8656a89532293f4"
//          ),
//      ]
//)


//import PackageDescription

// swift-tools-version:5.3
import PackageDescription

let checksum = "cdceb6f13d2302bfdbf95f26d013264c678058ffbf1226034aaa0be1763d796b"
let version = "2.7.0"

//let package = Package(
//    name: "IDWiseSDK",
//    platforms: [
//        .iOS(.v13)
//    ],
//    products: [
//        .library(
//            name: "IDWiseSDK",
//            targets: ["IDWiseSDK","FingerprintPro"]
//        )
//    ],
//    targets: [
//        .binaryTarget(
//            name: "FingerprintPro",
//            url: "https://fpjs-public.s3.amazonaws.com/ios/\(version)/FingerprintPro-\(version)-\(checksum).xcframework.zip",
//            checksum: checksum
//        ),
//        .binaryTarget(
//            name: "IDWiseSDK",
//            url: "https://mobile-sdk.idwise.ai/ios/5.1.6/IDWiseSDK.xcframework.zip",
//            checksum: "988aff83a10d8165cef6911c3b227040ecf87768bf90d003b8656a89532293f4"
//        ),
//    ],
//    swiftLanguageVersions: [.v5]
//)

let package = Package(
    name: "IDWise",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "IDWise",
            targets: ["IDWise"])
    ],
    targets: [
        .target(
            name: "IDWise",
            dependencies: [
                .target(name: "IDWiseSDK", condition: .when(platforms: [.iOS])),
                .target(name: "FingerprintPro", condition: .when(platforms: [.iOS]))
            ],
            path: "Sources/IDWise"
        ),
        .binaryTarget(
            name: "FingerprintPro",
            url: "https://fpjs-public.s3.amazonaws.com/ios/\(version)/FingerprintPro-\(version)-\(checksum).xcframework.zip",
            checksum: checksum
        ),
        .binaryTarget(
            name: "IDWiseSDK",
            url: "https://mobile-sdk.idwise.ai/ios/5.1.6/IDWiseSDK.xcframework.zip",
            checksum: "988aff83a10d8165cef6911c3b227040ecf87768bf90d003b8656a89532293f4"
        ),
    ]
)
