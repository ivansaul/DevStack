//
//  DevStackApp.swift
//  DevStack
//
//  Created by @ivansaul on 1/8/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

@main
struct DevStackApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Container {
    var cheatsheetsDataService: Factory<CheatsheetsDataServiceProtocol> {
        self { CheatsheetsDataService() }
            .shared
    }

    var cheatsheetsViewModel: Factory<CheatsheetsViewModel> {
        self { CheatsheetsViewModel(cheatsheetsDataService: self.cheatsheetsDataService()) }
            .cached
    }
}
