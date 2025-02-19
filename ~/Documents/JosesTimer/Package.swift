// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "JosesTimer",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "JosesTimer",
            targets: ["JosesTimer"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JosesTimer",
            dependencies: []),
        .testTarget(
            name: "JosesTimerTests",
            dependencies: ["JosesTimer"])
    ]
) 