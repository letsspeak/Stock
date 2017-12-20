// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Stock",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "stock", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.1.0")),
        .package(url: "https://github.com/vapor/leaf-provider.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/DanToml/Jay.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "LeafProvider", "FluentProvider", "Jay"],
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)

#if os(Linux)
let duktape = Package(url: "https://github.com/remko/swift-duktape.git", upToNextMinor(from: "0.2.0"))
package.dependencies.append(duktape)
#endif
