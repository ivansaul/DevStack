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
    let name: String
    let title: String
    let tags: [String]
    let categories: [String]
    let background: String
    let icon: String
    let intro: String
    let sections: [SectionSheet]
}

struct SectionSheet: Codable, Hashable {
    let title: String
    let content: String
}

extension Cheatsheet {
    var id: String {
        self.name
    }
}
