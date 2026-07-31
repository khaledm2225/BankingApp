// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SecurityKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "SecurityKit", targets: ["SecurityKit"])
    ],
    dependencies: [
        .package(path: "../Core"),
    ],
    targets: [
        .target(name: "SecurityKit", dependencies: ["Core", ]),
        .testTarget(name: "SecurityKitTests", dependencies: ["SecurityKit"])
    ]
)
