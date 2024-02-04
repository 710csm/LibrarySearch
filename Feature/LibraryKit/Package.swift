// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LibraryKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "LibraryKit",
            targets: ["LibraryKit"]
        ),
        .library(
            name: "LibraryKitImp",
            targets: ["LibraryKitImp"]
        ),
    ],
    dependencies: [
        .package(path: "./BaseKit"),
        .package(path: "./CoreKit"),
        .package(path: "./WebViewKit"),
        .package(path: "./Networking"),
    ],
    targets: [
        .target(
            name: "LibraryKit",
            dependencies: [
                .product(name: "BaseKit", package: "BaseKit"),
                .product(name: "CoreKit", package: "CoreKit"),
            ]
        ),
        .target(
            name: "LibraryKitImp",
            dependencies: [
                "LibraryKit",
                .product(name: "BaseKit", package: "BaseKit"),
                .product(name: "CoreKit", package: "CoreKit"),
                .product(name: "WebViewKit", package: "WebViewKit"),
                .product(name: "WebViewKitImp", package: "WebViewKit"),
                .product(name: "ImageLoader", package: "Networking"),
                .product(name: "Networking", package: "Networking"),            
            ]
        ),
        .testTarget(
            name: "LibraryKitTests",
            dependencies: ["LibraryKit"]
        ),
    ]
)
