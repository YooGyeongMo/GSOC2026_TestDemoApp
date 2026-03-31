// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestDemoApp",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TestDemoApp",
            targets: ["TestDemoApp"]
        ),
    ],
    dependencies: [
        .package(path: "/Users/demianyoo/Documents/GitHub/swift-testing"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TestDemoApp"
        ),
        .testTarget(
            name: "TestDemoAppTests",
            dependencies: [
                "TestDemoApp",
                .product(name: "Testing", package: "swift-testing"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
