// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "HomeFeature", targets: ["HomeFeature"])
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../DesignSystem"),
    ],
    targets: [
        .target(name: "HomeFeature", dependencies: ["Core", "DesignSystem", ]),
        .testTarget(name: "HomeFeatureTests", dependencies: ["HomeFeature"])
    ]
)
