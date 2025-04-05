//
//  CodeSyntaxThemeCatppuccin.swift
//  DevStack
//
//  Created by @ivansaul on 4/4/25.
//
//  https://github.com/ivansaul
//

import Splash

public extension Splash.Theme {
    static func catppuccinDark(withFont font: Splash.Font) -> Splash.Theme {
        return Splash.Theme(
            font: font,
            plainTextColor: Splash.Color(red: 0.95, green: 0.95, blue: 0.96, alpha: 1), // almost white
            tokenColors: [
                .keyword: Splash.Color(red: 0.98, green: 0.45, blue: 0.75, alpha: 1), // bright pink
                .string: Splash.Color(red: 0.58, green: 0.95, blue: 0.66, alpha: 1), // light green
                .type: Splash.Color(red: 1.00, green: 0.85, blue: 0.50, alpha: 1), // pastel yellow
                .call: Splash.Color(red: 0.60, green: 0.80, blue: 1.00, alpha: 1), // light blue
                .number: Splash.Color(red: 1.00, green: 0.65, blue: 0.30, alpha: 1), // orange
                .comment: Splash.Color(red: 0.55, green: 0.60, blue: 0.75, alpha: 1), // bluish gray
                .property: Splash.Color(red: 0.93, green: 0.73, blue: 1.00, alpha: 1), // light lilac
                .dotAccess: Splash.Color(red: 0.60, green: 0.80, blue: 1.00, alpha: 1),
                .preprocessing: Splash.Color(red: 1.00, green: 0.65, blue: 0.30, alpha: 1)
            ],
            backgroundColor: Splash.Color(red: 0.12, green: 0.13, blue: 0.18, alpha: 1) // dark bluish black
        )
    }

    static func catppuccinLight(withFont font: Splash.Font) -> Splash.Theme {
        return Splash.Theme(
            font: font,
            plainTextColor: Splash.Color(red: 0.15, green: 0.15, blue: 0.20, alpha: 1), // almost black
            tokenColors: [
                .keyword: Splash.Color(red: 0.79, green: 0.11, blue: 0.50, alpha: 1), // strong magenta
                .string: Splash.Color(red: 0.20, green: 0.65, blue: 0.35, alpha: 1), // forest green
                .type: Splash.Color(red: 0.75, green: 0.55, blue: 0.10, alpha: 1), // old gold
                .call: Splash.Color(red: 0.16, green: 0.40, blue: 0.85, alpha: 1), // strong blue
                .number: Splash.Color(red: 0.90, green: 0.40, blue: 0.00, alpha: 1), // dark orange
                .comment: Splash.Color(red: 0.50, green: 0.52, blue: 0.60, alpha: 1), // medium gray
                .property: Splash.Color(red: 0.55, green: 0.20, blue: 0.75, alpha: 1), // intense violet
                .dotAccess: Splash.Color(red: 0.16, green: 0.40, blue: 0.85, alpha: 1),
                .preprocessing: Splash.Color(red: 0.90, green: 0.40, blue: 0.00, alpha: 1)
            ],
            backgroundColor: Splash.Color(red: 0.97, green: 0.96, blue: 0.93, alpha: 1) // light ivory
        )
    }
}
