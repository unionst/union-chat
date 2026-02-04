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
        .package(url: "https://github.com/unionst/union-buttons.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "UnionChatWrapper",
            dependencies: [
                "UnionChatBinary",
                .product(name: "UnionMaterials", package: "union-materials"),
                .product(name: "UnionButtons", package: "union-buttons")
            ],
            path: "Sources/UnionChatWrapper"
        ),
        .binaryTarget(
            name: "UnionChatBinary",
            url: "https://github.com/unionst/union-chat/releases/download/0.7.1-beta.13/UnionChat.xcframework.zip",
            checksum: "a8eba9fbb73e41c02dfdd935e80dfd1a784d58664045c73c1bc31138a38504f6"
        )
    ]
)

