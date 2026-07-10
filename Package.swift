// swift-tools-version: 6.3.3

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
        .package(url: "https://github.com/swift-primitives/swift-algebra-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-bit-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Bit Algebra Primitives",
            dependencies: [
                .product(name: "Algebra Monoid Primitives", package: "swift-algebra-primitives"),
                .product(name: "Algebra Semiring Primitives", package: "swift-algebra-primitives"),
                .product(name: "Algebra Semilattice Primitives", package: "swift-algebra-primitives"),
                .product(name: "Algebra Lattice Primitives", package: "swift-algebra-primitives"),
                .product(name: "Algebra Field Primitives", package: "swift-algebra-primitives"),
                .product(name: "Bit Primitive", package: "swift-bit-primitives"),
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
