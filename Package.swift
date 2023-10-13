// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Screeen",
    platforms: [
      .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "Screeen",
            targets: ["Screeen"]),
    ],
    targets: [
        .target(
            name: "Screeen",
            dependencies: [],
            path: "Lib/Screeen"),
        .testTarget(
            name: "ScreeenTests",
            dependencies: ["Screeen"],
            path: "Lib/ScreeenTests"),
    ],
    swiftLanguageVersions: [.v5]
)
