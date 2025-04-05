//
//  MarkdownView.swift
//  DevStack
//
//  Created by @ivansaul on 1/14/25.
//
//  https://github.com/ivansaul
//

import MarkdownUI
import Splash
import SwiftUI

struct MarkdownView: View {
    @Environment(\.colorScheme) private var colorScheme
    let content: String

    var body: some View {
        Markdown(self.content)
            .markdownBlockStyle(\.codeBlock) {
                self.codeBlock($0)
            }
            .markdownTextStyle(\.text) {
                BackgroundColor(Color.theme.clear)
                FontSize(16)
            }
            .markdownTextStyle(\.code) {
                ForegroundColor(Color.theme.label)
                BackgroundColor(Color.theme.gray.opacity(0.2))
            }
            .markdownCodeSyntaxHighlighter(.splash(theme: self.theme))
            .markdownTheme(.gitHub)
    }

    @ViewBuilder
    private func codeBlock(_ configuration: CodeBlockConfiguration) -> some View {
        VStack(spacing: 0) {
            ZStack {
                ScrollView(.horizontal) {
                    configuration.label
                        .relativeLineSpacing(.em(0.25))
                        .markdownTextStyle {
                            FontFamilyVariant(.monospaced)
                            FontSize(.em(0.85))
                        }
                        .padding()
                }
                .scrollIndicators(.never)

                Button(action: {
                    self.copyToClipboard(configuration.content)
                }, label: {
                    Image(systemName: "doc.on.doc")
                        .font(.caption)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
            }
        }
        .background(Color.theme.background3)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .markdownMargin(top: .zero, bottom: .em(0.8))
    }

    private var theme: Splash.Theme {
        switch self.colorScheme {
        case .dark:
            return .catppuccinDark(withFont: .init(size: 16))

        case .light:
            return .catppuccinLight(withFont: .init(size: 16))

        default:
            return .sundellsColors(withFont: .init(size: 16))
        }
    }

    private func copyToClipboard(_ string: String) {
        #if os(macOS)
            if let pasteboard = NSPasteboard.general {
                pasteboard.clearContents()
                pasteboard.setString(string, forType: .string)
            }
        #elseif os(iOS)
            UIPasteboard.general.string = string
        #endif
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            MarkdownView(content: Cheatsheet.preview.sections.first!.content)
        }
        .navigationTitle("Getting Started")
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .backgroundApp()
    }
}
