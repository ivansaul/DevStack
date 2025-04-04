//
//  CheatsheetRowView.swift
//  DevStack
//
//  Created by @ivansaul on 1/13/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct CheatsheetRowView: View {
    let title: String
    let leadingIcon: LeadingIcon
    let trailingIcon: String
    var backgroundIconColor: Color = .blue

    var body: some View {
        HStack {
            leadingIconView(icon: leadingIcon)
                .foregroundStyle(Color.theme.white)
                .frame(width: 20, height: 20)
                .padding(5)
                .background(backgroundIconColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))

            Text(title)
                .fontWeight(.semibold)
                .tint(Color.theme.label)
                .multilineTextAlignment(.leading)

            Spacer()

            Image(systemName: trailingIcon)
                .font(.caption)
                .tint(Color.theme.gray)
        }
        .padding()
        .background(Color.theme.background3)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.bottom, 5)
    }

    @ViewBuilder
    func leadingIconView(icon: LeadingIcon) -> some View {
        switch icon {
        case .system(let name):
            Image(systemName: name)
        case .url(let url):
            CachedImageView(url: URL(string: url)) { image in
                image
                    .resizable()
                    .renderingMode(.template)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.theme.background2
            .ignoresSafeArea()

        CheatsheetRowView(
            title: "Python",
            leadingIcon: .system("text.viewfinder"),
            trailingIcon: "chevron.right"
        )
    }
}

extension CheatsheetRowView {
    enum LeadingIcon {
        case system(String)
        case url(String)
    }
}
