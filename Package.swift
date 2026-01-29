// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "RMQClient",
    platforms: [.iOS(.v12), .macOS(.v10_13)],
    products: [.library(name: "RMQClient", targets: ["RMQClient"])],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", from: "7.6.5"),
        .package(url: "https://github.com/naswadani/JKVValue.git", branch: "spm-support")
    ],
    targets: [
        .target(
            name: "RMQClient",
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket"),
                .product(name: "JKVValue", package: "JKVValue")
            ],
            path: "RMQClient",
            publicHeadersPath: "include", 
            cSettings: [
                .headerSearchPath(".")
            ],
            linkerSettings: [
                .linkedFramework("Security"),
                .linkedFramework("CFNetwork")
            ]
        )
    ]
)