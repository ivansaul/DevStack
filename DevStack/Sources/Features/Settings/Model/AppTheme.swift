//
//  AppTheme.swift
//  DevStack
//
//  Created by @ivansaul on 4/5/25.
//
//  https://github.com/ivansaul
//

enum AppTheme: String, CaseIterable, Codable {
    case dark = "Dark"
    case light = "Light"
    case system = "System"
}

extension AppTheme: Identifiable {
    var id: Self { self }
}
