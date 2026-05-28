// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-bit-algebra-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Bit Algebra Primitives",
            targets: ["Bit Algebra Primitives"]
        ),
        .library(
            name: "Bit Algebra Primitives Test Support",
            targets: ["Bit Algebra Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-algebra-field-primitives"),
        .package(path: "../swift-bit-primitives"),
    ],
    targets: [
        .target(
            name: "Bit Algebra Primitives",
            dependencies: [
                .product(name: "Algebra Field Primitives", package: "swift-algebra-field-primitives"),
                .product(name: "Bit Boolean Primitives", package: "swift-bit-primitives"),
            ]
        ),
        .target(
            name: "Bit Algebra Primitives Test Support",
            dependencies: [
                "Bit Algebra Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Algebra Primitives Tests",
            dependencies: [
                "Bit Algebra Primitives",
                "Bit Algebra Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
