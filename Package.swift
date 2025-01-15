// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IDWiseSPM",
    platforms: [
           .iOS(.v13)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IDWiseSPM",
            targets: ["IDWise"])
    ],
    dependencies: [
            // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios", from: "2.7.0")
        ],
    targets: [
          // Targets are the basic building blocks of a package. A target can define a module or a test suite.
          // Targets can depend on other targets in this package, and on products in packages this package depends on.
          .binaryTarget(
              name: "IDWise",
              url: "https://mobile-sdk.idwise.ai/ios/5.1.6/IDWiseSDK.xcframework.zip",
              checksum: "988aff83a10d8165cef6911c3b227040ecf87768bf90d003b8656a89532293f4"
          ),
      ]
)
