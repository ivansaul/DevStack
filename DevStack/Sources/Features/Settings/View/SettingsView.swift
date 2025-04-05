//
//  SettingsView.swift
//  DevStack
//
//  Created by @ivansaul on 4/4/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct SettingsView: View {
    @Injected(\.appThemeViewModel) private var appThemeViewModel

    var body: some View {
        @Bindable var appThemeViewModel = appThemeViewModel
        List {
            Section {
                AppearanceView(theme: $appThemeViewModel.selectedTheme)
            } header: {
                Text("General")
            }

            .listRowSeparator(.hidden)
        }
        .navigationTitle("Setttings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
