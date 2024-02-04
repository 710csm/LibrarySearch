// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "CoreKit",
            targets: ["CoreKit"]),
    ],
    dependencies: [
        .package(path: "./Util"),
        .package(path: "./DesignSystem"),
        .package(url: "https://github.com/ReactiveX/RxSwift", exact: "6.6.0"),
    ],
    targets: [
        .target(
            name: "CoreKit",
            dependencies: [
                .product(name: "Util", package: "Util"),
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
    ]
)
