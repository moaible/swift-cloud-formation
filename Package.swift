// swift-tools-version:5.2
// Managed by ice

import PackageDescription

let package = Package(
    name: "swift-cli-boilerplate",
    dependencies: [
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.2"),
    ],
    targets: [
        .target(name: "swift-cli-boilerplate", dependencies: ["SwiftCLI"]),
        .testTarget(name: "swift-cli-boilerplateTests", dependencies: ["swift-cli-boilerplate"]),
    ]
)
