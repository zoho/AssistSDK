// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AssistSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AssistSDK",
            targets: ["AssistSDKBinary", "Foundation_Extention", "ZSocketHandler"])
    ],
    dependencies: [
        .package(url: "https://github.com/kishorekumar007/ZReachability.swift.git", .branch("master"))
    ],
    targets: [
        .binaryTarget(
            name: "AssistSDKBinary",
            path: "SDK/AssistSDK.xcframework"
        ),
        .binaryTarget(
            name: "Foundation_Extention",
            path: "SDK/Foundation_Extention.xcframework"
        ),
        .binaryTarget(
            name: "ZSocketHandler",
            path: "SDK/ZSocketHandler.xcframework"
        )
    ]
)
