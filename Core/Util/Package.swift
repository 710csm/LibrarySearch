// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Util",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Util",
            targets: ["Util"]
        ),
        .library(
            name: "TestUtil",
            targets: ["TestUtil"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", exact: "6.6.0"),
    ],
    targets: [
        .target(
            name: "Util",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .target(
            name: "TestUtil",
            dependencies: [
            ]
        ),
    ]
)
