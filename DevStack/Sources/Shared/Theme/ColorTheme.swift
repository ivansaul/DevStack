//
//  ColorTheme.swift
//  DevStack
//
//  Created by @ivansaul on 4/3/25.
//
//  https://github.com/ivansaul
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let primary = Color.primary
    let label = Color(.label)
    let separator = Color(.separator)

    let white = Color(.white)
    let gray = Color(.gray)
    let blue = Color(.blue)

    let background = Color(.systemBackground)
    let background2 = Color(.secondarySystemBackground)
    let background3 = Color(.tertiarySystemBackground)
}
