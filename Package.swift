// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftFormatPlugins",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .plugin(name: "SwiftFormatBuildToolPlugin", targets: ["SwiftFormatBuildToolPlugin"]),
        .plugin(name: "SwiftFormatCommandPlugin", targets: ["SwiftFormatCommandPlugin"])
    ],
    targets: [
        .plugin(
            name: "SwiftFormatBuildToolPlugin",
            capability: .buildTool(),
            dependencies: [.target(name: "SwiftFormatBinary")]
        ),
        .plugin(
            name: "SwiftFormatCommandPlugin",
            capability: .command(intent: .custom(verb: "SwiftFormat", description: "SwiftFormat Command Plugin")),
            dependencies: [.target(name: "SwiftFormatBinary")]
        ),
        .binaryTarget(
            name: "SwiftFormatBinary",
            path: "SwiftFormatBinary.artifactbundle"
        )
    ]
)
