// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let pkgName = "IDOSDK-lite"
let package = Package(
    name: pkgName,
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: pkgName,
            targets: [pkgName]),
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.11"))
    ],
    targets: [
        .target(
            name: pkgName,
            dependencies: [
                "App",
                "Flutter",
                "FlutterPluginRegistrant",
                "native_channel",
                "protocol_channel",
                "IDOUtils",
                "protocol_c",
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: pkgName,
            resources: [
                .process("icon_assets.bundle")
            ],
            cSettings: [
                .define("PLATFORM_TYPE=2"),
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_PKCRYPT"),
                .define("HAVE_STDINT_H"),
                .define("HAVE_WZAES"),
                .define("HAVE_ZLIB"),
                .define("VAR_ARRAYS"),
                .define("USE_ALLOCA"),
                .define("NONTHREADSAFE_PSEUDOSTACK"),
                .define("OPUS_BUILD"),
                .define("STDC_HEADERS")
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("iconv"),
                .linkedLibrary("c++"),
            ]
        ),
        .binaryTarget(
            name: "IDOUtils",
            path: "./IDOSDK-lite/libs/IDOUtils.xcframework"
        ),
        .binaryTarget(
            name: "protocol_c",
            path: "./IDOSDK-lite/libs/protocol_c.xcframework"
        ),
        .binaryTarget(
            name: "App",
            path: "./IDOSDK-lite/libs/App.xcframework"
        ),
        .binaryTarget(
            name: "Flutter",
            path: "./IDOSDK-lite/libs/Flutter.xcframework"
        ),
        .binaryTarget(
            name: "FlutterPluginRegistrant",
            path: "./IDOSDK-lite/libs/FlutterPluginRegistrant.xcframework"
        ),
        .binaryTarget(
            name: "native_channel",
            path: "./IDOSDK-lite/libs/native_channel.xcframework"
        ),
        .binaryTarget(
            name: "protocol_channel",
            path: "./IDOSDK-lite/libs/protocol_channel.xcframework"
        ),
    ]
)
