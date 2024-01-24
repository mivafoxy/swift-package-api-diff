// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftPackageApiDiff",
    platforms: [.macOS("10.15.4")],
    products: [
        .library(
            name: "SwiftPackageApiDiff",
            targets: ["swift-package-api-diff"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git",
                 from: ("1.0.1")),
        .package(name: "SwiftPM",
                 url: "https://github.com/apple/swift-package-manager.git",
                 .branch("7b898e6cad75a3c096ad947508eb948ad5f614d4")),
        .package(url: "https://github.com/JohnSundell/Files",
                 from: "4.0.2")
    ],
    targets: [
        .target(name: "SwiftPackageApiDiff",
                dependencies: [
                    .product(name: "ArgumentParser",
                             package: "swift-argument-parser"),
                    .product(name: "Files",
                             package: "Files"),
                    .product(name: "SwiftPM-auto",
                             package: "SwiftPM"),
                ], path: "Sources")
    ]
)
