// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nashdown",

    platforms: [.macOS(.v11), .iOS(.v11)],

    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Nashdown",
            targets: ["Nashdown"]),
        .executable(name: "nashdown", targets: ["NashdownCLI"]),
    ],

    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.12.0"),
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Nashdown",
            dependencies: [.product(name: "Parsing", package: "swift-parsing")]),
        .executableTarget(
            name: "NashdownCLI",
            dependencies: ["Nashdown"]),
        .testTarget(
            name: "NashdownTests",
            dependencies: ["Nashdown"]),
    ]
)
