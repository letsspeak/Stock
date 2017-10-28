import PackageDescription
let package = Package(
    name: "Stock",
    targets: [
        Target(name: "clibc", dependencies: []),
        Target(
            name: "libc",
            dependencies: [
                "clibc"
            ]),
        Target(
            name: "POSIX",
            dependencies: [
                "libc"
            ]),
        Target(
            name: "StockHTTP",
            dependencies: [
                "POSIX",
            ]),
        Target(
            name: "Stock",
            dependencies: [
                "POSIX",
                "StockHTTP",
            ]),
    ],
    dependencies: [
       .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3),
       .Package(url: "https://github.com/PerfectlySoft/Perfect-MySQL.git", majorVersion: 3),
    ]
)
