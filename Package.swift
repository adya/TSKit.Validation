// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TSKit.Validation",
    products: [
        .library(
            name: "TSKit.Validation",
            targets: ["TSKit.Validation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/adya/TSKit.Core.git", .upToNextMajor(from: "2.3.0"))
    ],
    targets: [
        .target(
            name: "TSKit.Validation",
            dependencies: ["TSKit.Core"]),
        .testTarget(
            name: "TSKit.ValidationTests",
            dependencies: ["TSKit.Validation"]),
    ]
)
