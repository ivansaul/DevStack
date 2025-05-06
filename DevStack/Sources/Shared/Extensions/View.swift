//
//  View.swift
//  DevStack
//
//  Created by @ivansaul on 4/4/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

private struct AppBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.theme.background2
                .ignoresSafeArea()

            content
        }
    }
}

extension View {
    func backgroundApp() -> some View {
        modifier(AppBackgroundModifier())
    }
}

extension View {
    @ViewBuilder
    func redacted(when condition: @autoclosure () -> Bool) -> some View {
        redacted(reason: condition() ? .placeholder : [])
    }
}
