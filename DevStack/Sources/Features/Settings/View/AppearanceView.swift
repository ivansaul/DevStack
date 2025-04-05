//
//  AppearanceView.swift
//  DevStack
//
//  Created by @ivansaul on 4/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct AppearanceView: View {
    let theme: Binding<AppTheme>

    var body: some View {
        Picker(selection: theme) {
            ForEach(AppTheme.allCases) { theme in
                Text(theme.rawValue).tag(theme)
            }
        } label: {
            LabelRow("Appearance", imageName: "gear", color: Color.theme.blue)
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    NavigationStack {
        AppearanceView(theme: .constant(.dark))
    }
}
