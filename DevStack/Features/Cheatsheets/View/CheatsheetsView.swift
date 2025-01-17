//
//  CheatsheetsView.swift
//  DevStack
//
//  Created by @ivansaul on 1/8/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct CheatsheetsView: View {
    @Environment(CheatsheetsViewModel.self) private var cheatsheetsViewModel

    var body: some View {
        @Bindable var cheatsheetsViewModel = cheatsheetsViewModel

        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()

            ScrollView {
                Text("Here are some some cheat sheets and quick references contributed by open source angels.")

                ForEach(cheatsheetsViewModel.filteredCheatSheets) { cheatsheet in
                    NavigationLink(value: cheatsheet) {
                        CheatsheetRowView(
                            title: cheatsheet.title,
                            leadingIcon: .url(cheatsheet.icon),
                            trailingIcon: "chevron.right",
                            backgroundIconColor: .init(hex: cheatsheet.background)
                        )
                    }
                }
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
            .animation(.easeIn, value: cheatsheetsViewModel.searchText)
        }
        .navigationTitle("Cheat Sheets")
        .navigationBarTitleDisplayMode(.automatic)
        .searchable(text: $cheatsheetsViewModel.searchText)
        .autocorrectionDisabled(true)
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
            .environment(CheatsheetsViewModel.preview)
    }
}
