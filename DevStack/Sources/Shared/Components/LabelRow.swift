//
//  LabelRow.swift
//  DevStack
//
//  Created by @ivansaul on 4/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct LabelRow<T: View>: View {
    let title: String
    let imageName: String?
    let color: Color?
    let trailing: () -> T

    init(
        _ title: String,
        imageName: String? = nil,
        color: Color = Color.theme.blue,
        @ViewBuilder trailing: @escaping () -> T = { EmptyView() }
    ) {
        self.title = title
        self.imageName = imageName
        self.color = color
        self.trailing = trailing
    }

    var body: some View {
        HStack {
            if let systemName = imageName {
                Image(systemName: systemName)
                    .foregroundStyle(Color.theme.white)
                    .frame(width: 20, height: 20)
                    .padding(4)
                    .background(color)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
            }
            Text(title)
            Spacer()
            trailing()
        }
    }
}

#Preview {
    List {
        LabelRow("Appearance", imageName: "gear", color: .yellow)
        LabelRow("Code Options", imageName: "key", color: .orange)
        LabelRow("App Icon", imageName: "square.and.pencil") {
            Image(systemName: "chevron.right")
        }
    }
}
