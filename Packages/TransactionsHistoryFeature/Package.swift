// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "TransactionsHistoryFeature",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "TransactionsHistoryFeature", targets: ["TransactionsHistoryFeature"])
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../DesignSystem"),
    ],
    targets: [
        .target(name: "TransactionsHistoryFeature", dependencies: ["Core", "DesignSystem"]),
        .testTarget(name: "TransactionsHistoryFeatureTests", dependencies: ["TransactionsHistoryFeature"])
    ]
)
