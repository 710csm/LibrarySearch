// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
        .library(
            name: "NetworkingImp",
            targets: ["NetworkingImp"]
        ),
        .library(
            name: "ImageLoader",
            targets: ["ImageLoader"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", exact: "6.6.0"),
        .package(path: "./CoreKit"),
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .target(
            name: "NetworkingImp",
            dependencies: [
                "Networking",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .target(
            name: "ImageLoader",
            dependencies: [
                .product(name: "CoreKit", package: "CoreKit"),
            ]
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: [
                "Networking",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxBlocking", package: "RxSwift"),
            ]
        ),
    ]
)
