//
//  CheatsheetDetailView.swift
//  DevStack
//
//  Created by @ivansaul on 1/11/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct CheatsheetDetailView: View {
    let sectionSheet: SectionSheet
    var body: some View {
        ScrollView {
            MarkdownView(content: sectionSheet.content)
                .padding(.horizontal)
        }
        .scrollIndicators(.never)
        .navigationTitle(sectionSheet.title)
        .backgroundApp()
    }
}

#Preview {
    NavigationStack {
        CheatsheetDetailView(sectionSheet: .preview)
    }
}
