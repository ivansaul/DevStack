//
//  CachedImageView.swift
//  DevStack
//
//  Created by @ivansaul on 1/12/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

import SDWebImageSwiftUI

struct CachedImageView<C: View, P: View>: View {
    let url: URL?
    let content: (Image) -> C
    let placeholder: () -> P

    init(url: URL?, @ViewBuilder content: @escaping (Image) -> C, @ViewBuilder placeholder: @escaping () -> P = { ProgressView() }) {
        self.url = url
        self.content = content
        self.placeholder = placeholder
    }

    var body: some View {
        WebImage(url: url) { image in
            content(image)
        } placeholder: {
            placeholder()
        }
    }
}

#Preview {
    let url = URL(string: Cheatsheet.preview.icon)

    let url1 = URL(string: "")

    return VStack {
        CachedImageView(url: url) { image in
            image
                .resizable()
                .renderingMode(.template)
        } placeholder: {
            ProgressView()
        }
        .foregroundStyle(.white)
        .frame(width: 100, height: 100)
        .padding()
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))

        CachedImageView(url: url1) { image in
            image
        }
    }
}
