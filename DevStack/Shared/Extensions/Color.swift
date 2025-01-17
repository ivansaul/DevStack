//
//  Color.swift
//  DevStack
//
//  Created by @ivansaul on 1/10/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexString = hex.replacingOccurrences(of: "#", with: "")

        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            let red = Double((hexNumber & 0xFF0000) >> 16) / 255.0
            let green = Double((hexNumber & 0x00FF00) >> 8) / 255.0
            let blue = Double(hexNumber & 0x0000FF) / 255.0

            self.init(red: red, green: green, blue: blue)
        } else {
            self.init(red: 0.0, green: 0.0, blue: 1.0)
        }
    }
}
