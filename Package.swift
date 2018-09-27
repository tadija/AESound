// swift-tools-version:4.2

/**
 *  https://github.com/tadija/AESound
 *  Copyright (c) Marko Tadić 2018
 *  Licensed under the MIT license. See LICENSE file.
 */

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
