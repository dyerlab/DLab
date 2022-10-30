// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DLab",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DLab",
            targets: ["DLab"]
        ),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "DLab",
            dependencies: [],
            resources: [
                .copy("Resources/tree.png"),
                .copy("Resources/dyer.jpeg"),
                .copy("Resources/arapat.csv")
            ]
        ),
        .testTarget(
            name: "DLabTests",
            dependencies: ["DLab"]
        ),
    ]
)
