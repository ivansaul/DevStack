//
//  AppDelegate.swift
//  DevStack
//
//  Created by @ivansaul on 1/10/25.
//
//  https://github.com/ivansaul
//

import SDWebImageSVGNativeCoder

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        SDImageCodersManager.shared.addCoder(SDImageSVGNativeCoder.shared)
        return true
    }
}
