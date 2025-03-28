//
//  CheatsheetDetailView.swift
//  DevStack
//
//  Created by @ivansaul on 1/11/25.
//
//  https://github.com/ivansaul
//

import MarkdownUI
import Splash
import SwiftUI

struct CheatsheetDetailView: View {
    let sectionSheet: SectionSheet
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()

            ScrollView {
                MarkdownView(content: self.sectionSheet.content)
                    .padding(.horizontal)
            }
            .scrollIndicators(.never)
        }
        .navigationTitle(sectionSheet.title)
    }
}

#Preview {
    NavigationStack {
        CheatsheetDetailView(sectionSheet: Cheatsheet.preview.sections.first!)
    }
}
