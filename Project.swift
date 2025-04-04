import ProjectDescription

let project = Project(
    name: "DevStack",
    targets: [
        .target(
            name: "DevStack",
            destinations: .iOS,
            product: .app,
            bundleId: "com.ivansaul.DevStack",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["DevStack/Sources/**"],
            resources: ["DevStack/Resources/**"],
            dependencies: [
                .external(name: "MarkdownUI"),
                .external(name: "AsyncAlgorithms"),
                .external(name: "SDWebImageSwiftUI"),
                .external(name: "SDWebImageSVGNativeCoder"),
                .external(name: "Splash"),
                .external(name: "Factory"),
            ],
            settings: .settings(
                base: ["OTHER_LDFLAGS": "$(inherited) -ObjC"]
            )
        ),
    ]
)
