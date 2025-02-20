// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "JosesTimer",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "JosesTimer",
            targets: ["JosesTimer"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JosesTimer",
            dependencies: [],
            resources: [
                .process("Resources")
            ]),
        .testTarget(
            name: "JosesTimerTests",
            dependencies: ["JosesTimer"])
    ]
)
