import PackageDescription

let package = Package(
    name: "schau-maschine",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-XML.git", majorVersion: 2, minor: 0),
        .Package(url: "https://github.com/ReactiveX/RxSwift.git", majorVersion: 3),
        ]
)
