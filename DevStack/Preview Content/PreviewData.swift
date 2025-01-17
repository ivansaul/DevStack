//
//  PreviewData.swift
//  DevStack
//
//  Created by @ivansaul on 1/10/25.
//
//  https://github.com/ivansaul
//

import Foundation

extension [Cheatsheet] {
    static var preview: [Cheatsheet] {
        let url = Bundle.main.url(forResource: "cheatsheets", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let result = try! JSONDecoder().decode([Cheatsheet].self, from: data)
        return result
    }
}

extension Cheatsheet {
    static var preview: Cheatsheet {
        return [Cheatsheet].preview.first!
    }
}
