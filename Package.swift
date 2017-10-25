import PackageDescription
let package = Package(
  name: "Stock",
  targets: [],
  dependencies: [
    .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3),
    .Package(url: "https://github.com/PerfectlySoft/Perfect-MySQL.git", majorVersion: 3)
  ]
)
