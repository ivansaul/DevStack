//
//  ContentView.swift
//  DevStack
//
//  Created by @ivansaul on 1/8/25.
//
//  https://github.com/ivansaul
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            CheatsheetsView()
        }
    }
}

#Preview {
    ContentView()
        .environment(CheatsheetsViewModel.preview)
}
