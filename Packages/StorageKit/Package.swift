// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "StorageKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "StorageKit", targets: ["StorageKit"])
    ],
    dependencies: [
        .package(path: "../Core"),
    ],
    targets: [
        .target(name: "StorageKit", dependencies: ["Core", ]),
        .testTarget(name: "StorageKitTests", dependencies: ["StorageKit"])
    ]
)
