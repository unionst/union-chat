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
            url: "https://github.com/unionst/union-chat/releases/download/0.7.1-beta.18/UnionChat.xcframework.zip",
            checksum: "dc4cfbf22ab9356280e56d81a94391c50eab6b99f379e371a89528cfd28dcf89"
        )
    ]
)
