// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Parsers",
    products: [
        .library(
            name: "Parsers",
            targets: ["Parsers"]
		),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Parsers",
            dependencies: []
		),
        .testTarget(
            name: "ParsersTests",
            dependencies: ["Parsers"]
		),
    ]
)
