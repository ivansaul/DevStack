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
    static let preview = cheatsheets
}

extension Cheatsheet {
    static let preview = [Self].preview.first!
}

extension SectionSheet {
    static let preview = [Cheatsheet].preview.first!.sections!.first!
}

private let cheatsheets: [Cheatsheet] = load("cheatsheets.json")

private func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else { fatalError("Couldn't find \(filename) in main bundle.") }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
