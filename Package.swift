// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AirAlert",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AirAlert",
            targets: ["AirAlert"]),
    ],
    targets: [
        .target(
            name: "AirAlert",
            sources: ["AirAlert.swift", "View+AirAlert.swift"]
        ),
        .testTarget(
            name: "AirAlertTests",
            dependencies: ["AirAlert"]
        ),
    ]
)
