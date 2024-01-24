// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "swift-package-api-diff",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "swiftPackageApiDiff",
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
        .target(name: "swift-package-api-diff",
                dependencies: [
                    .product(name: "ArgumentParser",
                             package: "swift-argument-parser"),
                    .product(name: "Files",
                             package: "Files"),
                    .product(name: "SwiftPM-auto",
                             package: "SwiftPM"),
                ]),
        .testTarget(name: "swift-package-api-diff-tests",
                    dependencies: [
                        "swift-package-api-diff",
                        .product(name: "Files",
                                 package: "Files"),
                        .product(name: "SwiftPM-auto",
                                 package: "SwiftPM"),
                    ]),
    ]
)
