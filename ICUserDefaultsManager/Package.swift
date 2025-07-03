// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ICUserDefaultsManager",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // 公開するモジュールを定義
        .library(
            name: "ICUserDefaultsManager",
            targets: ["ICUserDefaultsManager"]
        ),
    ],
    dependencies: [
        // 外部依存関係があればここに追加
        // .package(url: "https://github.com/example/package.git", from: "1.0.0"),
    ],
    targets: [
        // ICUserDefaultsManagerモジュール
        .target(
            name: "ICUserDefaultsManager",
            dependencies: [],
            path: "Sources/ICUserDefaultsManager"
        ),
    ]
)
