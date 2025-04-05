//
//  ThemeViewModel.swift
//  DevStack
//
//  Created by @ivansaul on 4/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

@Observable
class AppThemeViewModel {
    var selectedTheme: AppTheme = .system {
        didSet { Task { await persistTheme() } }
    }

    var colorSchema: ColorScheme? {
        switch selectedTheme {
        case .dark:
            return ColorScheme.dark
        case .light:
            return ColorScheme.light
        case .system:
            return nil
        }
    }

    private let settingsDataService: KeyValueStorageDataService

    private let selectedThemeKey = "selectedTheme"

    init(keyValueStorageDataService: KeyValueStorageDataService) {
        self.settingsDataService = keyValueStorageDataService
        Task { await loadTheme() }
    }

    private func persistTheme() async {
        await settingsDataService.set(selectedTheme, forKey: selectedThemeKey)
    }

    private func loadTheme() async {
        let savedTheme = await settingsDataService.get(forKey: selectedThemeKey, as: AppTheme.self)
        guard let savedTheme = savedTheme else {
            selectedTheme = AppTheme.system
            return
        }
        selectedTheme = savedTheme
    }
}
