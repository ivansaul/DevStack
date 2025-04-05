//
//  ContentView.swift
//  DevStack
//
//  Created by @ivansaul on 1/8/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct ContentView: View {
    @Injected(\.appThemeViewModel) private var appThemeViewModel

    var body: some View {
        NavigationStack {
            CheatsheetsView()
        }
        .preferredColorScheme(appThemeViewModel.colorSchema)
    }
}

#Preview {
    ContentView()
}
