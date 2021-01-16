// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AESound",
    products: [
        .library(name: "AESound", targets: ["AESound"])
    ],
    targets: [
        .target(
            name: "AESound"
        )
    ]
)
