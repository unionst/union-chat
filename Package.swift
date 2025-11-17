// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "union-chat",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "UnionChat",
            targets: ["UnionChat"])
    ],
    dependencies: [
        .package(url: "https://github.com/unionst/union-materials.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/unionst/union-buttons.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "UnionChat",
            url: "https://github.com/unionst/union-chat/releases/download/0.4.0/UnionChat.xcframework.zip",
            checksum: "REPLACE_WITH_ACTUAL_CHECKSUM"
        )
    ]
)

