// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "JustToneCore",
    platforms: [.iOS(.v27), .watchOS(.v27)],
    products: [.library(name: "JustToneCore", targets: ["JustToneCore"])],
    targets: [
        .target(name: "JustToneCore"),
        .testTarget(name: "JustToneCoreTests", dependencies: ["JustToneCore"]),
    ]
)
