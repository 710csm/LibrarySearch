// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BaseKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "BaseKit",
            targets: ["BaseKit"]
        ),
    ],
    targets: [
        .target(
            name: "BaseKit"
        ),
    ]
)
