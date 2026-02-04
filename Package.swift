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
            targets: ["UnionChatWrapper", "UnionChatBinary"])
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "UnionChatWrapper",
            dependencies: [
                "UnionChatBinary",
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            path: "Sources/UnionChatWrapper"
        ),
        .binaryTarget(
            name: "UnionChatBinary",
            url: "https://github.com/unionst/union-chat/releases/download/0.7.1-beta.20/UnionChat.xcframework.zip",
            checksum: "6e158f5d7d4064cf924c3083aec021d3615a7ef0a20523cab9bbf38ef1dd3767"
        )
    ]
)
