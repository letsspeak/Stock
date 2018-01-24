// swift-tools-version:4.0

import PackageDescription

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.1.0")),
    .package(url: "https://github.com/vapor/leaf-provider.git", from: "1.0.0"),
    .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.2.0")),
    .package(url: "https://github.com/vapor/mysql-provider.git", .upToNextMajor(from: "2.0.0")),
    .package(url: "https://github.com/DanToml/Jay.git", from: "1.0.1"),
    .package(url: "https://github.com/remko/swift-duktape.git", .upToNextMinor(from: "0.2.0")),
]

var appDependencies: [Target.Dependency] = [
    "Vapor",
    "LeafProvider",
    "FluentProvider",
    "MySQLProvider",
    "Jay"
]

#if os(Linux)
packageDependencies.append(
    Package.Dependency.package(
        url: "https://github.com/remko/swift-duktape.git", .upToNextMinor(from: "0.2.0")))
appDependencies.append(Target.Dependency.byName(name: "swift-duktape"))
#endif

let package = Package(
    name: "Stock",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "stock", targets: ["Run"])
    ],
    dependencies: packageDependencies,
    targets: [
        .target(name: "App",
                dependencies: appDependencies,
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)
