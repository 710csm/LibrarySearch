// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WebViewKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "WebViewKit",
            targets: ["WebViewKit"]
        ),
        .library(
            name: "WebViewKitImp",
            targets: ["WebViewKitImp"]
        ),
    ],
    dependencies: [
        .package(path: "./BaseKit"),
        .package(path: "./CoreKit"),
    ],
    targets: [
        .target(
            name: "WebViewKit",
            dependencies: [
                .product(name: "BaseKit", package: "BaseKit"),
                .product(name: "CoreKit", package: "CoreKit"),
            ]
        ),
        .target(
            name: "WebViewKitImp",
            dependencies: [
                "WebViewKit",
                .product(name: "BaseKit", package: "BaseKit"),
                .product(name: "CoreKit", package: "CoreKit"),
            ]
        ),
        .testTarget(
            name: "WebViewKitTests",
            dependencies: ["WebViewKit"]
        ),
    ]
)
