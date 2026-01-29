// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "RMQClient",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "RMQClient",
            targets: ["RMQClient"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", from: "7.6.5"),
        .package(url: "https://github.com/naswadani/JKVValue.git", .branch("spm-support")),
    ],
    targets: [
        .target(
            name: "RMQClient",
            dependencies: [
                "CocoaAsyncSocket",
                "JKVValue",
            ],
            path: "RMQClient",
            publicHeadersPath: ".", 
            cSettings: [
                .headerSearchPath("."),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("Security"),
                .linkedFramework("CFNetwork")
            ]
        ),
        .testTarget(
            name: "RMQClientTests",
            dependencies: ["RMQClient"],
            path: "RMQClientTests"
        )
    ],
    cLanguageStandard: .c11
)
