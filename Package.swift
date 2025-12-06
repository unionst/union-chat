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
            url: "https://github.com/unionst/union-chat/releases/download/0.6.13/UnionChat.xcframework.zip",
            checksum: "a7d3671bc6141253372599e041cd70645be1a8575bcb9951cf363e4ae98f01c5"
        )
    ]
)

