//
//  CheatsheetContentView.swift
//  DevStack
//
//  Created by @ivansaul on 1/10/25.
//
//  https://github.com/ivansaul
//

import MarkdownUI
import SwiftUI

struct CheatsheetContentView: View {
    let cheatsheet: Cheatsheet

    var body: some View {
        ZStack {
            Color.theme.background2
                .ignoresSafeArea()

            ScrollView {
                Markdown(cheatsheet.intro)

                ForEach(cheatsheet.sections, id: \.self) { section in
                    NavigationLink {
                        CheatsheetDetailView(sectionSheet: section)
                    } label: {
                        CheatsheetRowView(
                            title: section.title,
                            leadingIcon: .system("text.viewfinder"),
                            trailingIcon: "chevron.right",
                            backgroundIconColor: Color(hex: cheatsheet.background)
                        )
                    }
                }
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
        }
        .navigationTitle(cheatsheet.title)
    }
}

#Preview {
    NavigationStack {
        CheatsheetContentView(cheatsheet: .preview)
    }
}
