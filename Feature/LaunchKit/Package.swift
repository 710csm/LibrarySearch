// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LaunchKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "LaunchKit",
            targets: ["LaunchKit"]
        ),
        .library(
            name: "LaunchKitImp",
            targets: ["LaunchKitImp"]
        ),
    ],
    dependencies: [
        .package(path: "./CoreKit"),
    ],
    targets: [
        .target(
            name: "LaunchKit",
            dependencies: [
                .product(name: "CoreKit", package: "CoreKit"),
            ]
        ),
        .target(
            name: "LaunchKitImp",
            dependencies: [
                "LaunchKit",
                .product(name: "CoreKit", package: "CoreKit"),
            ]
        ),
        .testTarget(
            name: "LaunchKitTests",
            dependencies: ["LaunchKit"]
        ),
    ]
)
