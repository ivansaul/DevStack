//
//  CheatsheetContentView.swift
//  DevStack
//
//  Created by @ivansaul on 1/10/25.
//
//  https://github.com/ivansaul
//

import Factory
import SwiftUI

struct CheatsheetContentView: View {
    let id: String

    @Environment(\.dismiss) private var dismiss
    @State private var vm: CheatsheetContentViewModel

    init(id: String) {
        self.id = id
        self._vm = State(wrappedValue: Container.shared.cheatsheetContentViewModel(id))
    }

    var body: some View {
        ScrollView {
            if let intro = vm.cheatsheet.intro {
                MarkdownView(content: intro)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            ForEach(vm.cheatsheet.sections ?? [], id: \.self) { section in
                NavigationLink(value: section) {
                    CheatsheetRowView(
                        title: section.title,
                        leadingIcon: .system("text.viewfinder"),
                        trailingIcon: "chevron.right",
                        backgroundIconColor: Color(hex: vm.cheatsheet.background ?? "")
                    )
                }
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        .navigationTitle(vm.cheatsheet.title)
        .backgroundApp()
        .redacted(when: vm.isLoading)
        .task { await vm.fetchCheatSheet() }
        .navigationDestination(for: SectionSheet.self) {
            CheatsheetDetailView(sectionSheet: $0)
        }
        .alert("Oops!", isPresented: $vm.showAlert) {
            Button("Cancel", role: .cancel) { dismiss() }
        } message: { Text(vm.errorMessage) }
    }
}

#Preview {
    NavigationStack {
        CheatsheetContentView(id: "swift")
    }
}
