// swift-tools-version:5.3

import PackageDescription
let package = Package(
    name: "swal-rawhtml",
    products: [
        .executable(name: "swal-rawhtml", targets: ["swal-rawhtml"])
    ],
    dependencies: [
        .package(name: "JavaScriptKit", url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.8.0"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "0.0.1"),
        .package(url: "https://github.com/johngarrett/HyperSwift", .branch("master"))
    ],
    targets: [
        .target(
            name: "swal-rawhtml",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                "HyperSwift"
            ]),
        .testTarget(
            name: "swal-rawhtmlTests",
            dependencies: ["swal-rawhtml"]),
    ]
)
