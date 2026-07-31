// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "NetworkKit", targets: ["NetworkKit"])
    ],
    dependencies: [
        .package(path: "../Core"),
    ],
    targets: [
        .target(name: "NetworkKit", dependencies: ["Core", ]),
        .testTarget(name: "NetworkKitTests", dependencies: ["NetworkKit"])
    ]
)
