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
    // MARK: DataService

    var cheatsheetsDataService: Factory<CheatsheetsDataServiceProtocol> {
        self { CheatsheetsDataService() }
            .onPreview { MockCheatsheetsDataService() }
            .shared
    }

    var keyValueStorageDataService: Factory<KeyValueStorageDataService> {
        self { UserDefaultsStorageDataService(defaults: UserDefaults.standard) }
            .singleton
    }

    // MARK: ViewModel

    var cheatsheetsViewModel: Factory<CheatsheetsViewModel> {
        self { CheatsheetsViewModel(cheatsheetsDataService: self.cheatsheetsDataService()) }
            .cached
    }

    var cheatsheetContentViewModel: ParameterFactory<String, CheatsheetContentViewModel> {
        self { CheatsheetContentViewModel(sheetID: $0, cheatsheetsDataService: self.cheatsheetsDataService()) }
    }

    var appThemeViewModel: Factory<AppThemeViewModel> {
        self { AppThemeViewModel(keyValueStorageDataService: self.keyValueStorageDataService()) }
            .singleton
    }
}
