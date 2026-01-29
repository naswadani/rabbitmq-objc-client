// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "RMQClient",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "RMQClient",
            targets: ["RMQClient"]
        )
    ],
    targets: [
        .target(
            name: "RMQClient",
            dependencies: [],
            path: ".",
            exclude: ["RMQClientTests", "RMQClientIntegrationTests"],
            sources: ["RMQClient"],
            publicHeadersPath: "RMQClient",
            cSettings: [
                .headerSearchPath("RMQClient"),
                .define("COCOAPODS", to: "1"),
                .unsafeFlags(["-fno-objc-arc"], .when(configuration: .debug))
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("Security"),
                .linkedFramework("CFNetwork")
            ]
        )
    ],
    cLanguageStandard: .c11
)
