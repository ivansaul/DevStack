//
//  Cheatsheet.swift
//  DevStack
//
//  Created by @ivansaul on 1/12/25.
//
//  https://github.com/ivansaul
//

import Foundation

struct Cheatsheet: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let tags: [String]?
    let categories: [String]?
    let background: String?
    let icon: String
    let intro: String?
    let sections: [SectionSheet]?
}

struct SectionSheet: Codable, Hashable {
    let title: String
    let content: String
}

extension Cheatsheet {
    static let placeholder: Self = .init(
        id: String(repeating: " ", count: Int.random(in: 1 ... 100)),
        title: String(repeating: " ", count: Int.random(in: 7 ... 12)),
        tags: Array(repeating: "        ", count: 3),
        categories: Array(repeating: "        ", count: 3),
        background: "#8E8E93",
        icon: " ",
        intro: "​" + String(repeating: " ", count: 80) + "​",
        sections: (1 ... 10)
            .map { _ in Int.random(in: 15 ... 20) }
            .map {
                SectionSheet(
                    title: String(repeating: " ", count: $0),
                    content: String(repeating: " ", count: Int.random(in: 50 ... 500))
                )
            }
    )
}
