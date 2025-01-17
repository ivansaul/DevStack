//
//  DevStackApp.swift
//  DevStack
//
//  Created by @ivansaul on 1/8/25.
//
//  https://github.com/ivansaul
//

import SDWebImage
import SDWebImageSVGNativeCoder
import SwiftUI

@main
struct DevStackApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State private var cheatsheetViewModel: CheatsheetsViewModel = .init(
        cheatsheetsDataService: CheatsheetsDataService()
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(cheatsheetViewModel)
        }
    }
}
