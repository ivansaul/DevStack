// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [:]
    )
#endif

let package = Package(
    name: "DevStack",
    dependencies: [
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
        .package(url: "https://github.com/gonzalezreal/swift-markdown-ui", from: "2.4.1"),
        .package(url: "https://github.com/apple/swift-async-algorithms", from: "1.0.3"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI", from: "3.1.3"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSVGNativeCoder", from: "0.2.0"),
        .package(url: "https://github.com/JohnSundell/Splash", from: "0.16.0"),
    ]
)
