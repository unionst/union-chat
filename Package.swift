// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "union-chat",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "UnionChat",
            targets: ["UnionChatWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/unionst/union-materials.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/unionst/union-buttons.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "UnionChatWrapper",
            dependencies: [
                "UnionChatBinary",
                .product(name: "UnionMaterials", package: "union-materials"),
                .product(name: "UnionButtons", package: "union-buttons"),
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            path: "Sources/UnionChatWrapper"
        ),
        .binaryTarget(
            name: "UnionChatBinary",
            url: "https://github.com/unionst/union-chat/releases/download/0.7.1-beta.14/UnionChat.xcframework.zip",
            checksum: "64b4cbf744b6db08d0f468d9e286dba647d4f38b2c1bb926e636f569dc561638"
        )
    ]
)
