// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "NNG",
  products: [
    .library(name: "NNG", targets: ["NNG"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "NNG", dependencies: ["Cnng"]),
    .testTarget(name: "NNGTests", dependencies: ["NNG"]),
    .systemLibrary(name: "Cnng"),
  ]
)
