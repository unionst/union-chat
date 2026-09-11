// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "swift-chat",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "SwiftChat",
            targets: ["SwiftChat"]),
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
            name: "SwiftChat",
            dependencies: [
                "UnionChatBinary",
                .product(name: "UnionMaterials", package: "union-materials"),
                .product(name: "UnionButtons", package: "union-buttons"),
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            path: "Sources/SwiftChat"
        ),
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
            url: "https://github.com/unionst/swift-chat/releases/download/1.0.0/UnionChat.xcframework.zip",
            checksum: "da7d56072f3834b4a5c67bd064ec264cbb8a575b60c7a8b9b2256291b41bf67e"
        )
    ]
)
