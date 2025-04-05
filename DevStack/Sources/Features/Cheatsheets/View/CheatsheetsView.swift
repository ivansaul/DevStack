//
//  CheatsheetsView.swift
//  DevStack
//
//  Created by @ivansaul on 1/8/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct CheatsheetsView: View {
    @Injected(\.cheatsheetsViewModel) private var cheatsheetsViewModel

    var body: some View {
        @Bindable var cheatsheetsViewModel = cheatsheetsViewModel

        ScrollView {
            Text("Here are some some cheat sheets and quick references contributed by open source angels.")

            ForEach(cheatsheetsViewModel.filteredCheatSheets) { cheatsheet in
                NavigationLink(value: cheatsheet) {
                    CheatsheetRowView(
                        title: cheatsheet.title,
                        leadingIcon: .url(cheatsheet.icon),
                        trailingIcon: "chevron.right",
                        backgroundIconColor: Color(hex: cheatsheet.background)
                    )
                }
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        .animation(.easeIn, value: cheatsheetsViewModel.searchText)
        .navigationTitle("Cheat Sheets")
        .navigationBarTitleDisplayMode(.automatic)
        .searchable(text: $cheatsheetsViewModel.searchText)
        .autocorrectionDisabled(true)
        .backgroundApp()
        .navigationDestination(for: Cheatsheet.self) { cheatsheet in
            CheatsheetContentView(cheatsheet: cheatsheet)
        }
        .task {
            await cheatsheetsViewModel.fetchCheatSheets()
        }
    }
}

#Preview {
    NavigationStack {
        CheatsheetsView()
    }
}
