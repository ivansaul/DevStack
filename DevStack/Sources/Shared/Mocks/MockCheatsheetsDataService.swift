//
//  MockCheatsheetsDataService.swift
//  DevStack
//
//  Created by @ivansaul on 1/16/25.
//
//  https://github.com/ivansaul
//

import Foundation

class MockCheatsheetsDataService: CheatsheetsDataServiceProtocol {
    private let mockData: [Cheatsheet] = .preview

    func fetchCheatsheets() async throws -> [Cheatsheet] {
        mockData
    }

    func fetchCheatsheet(byID id: String) async throws -> Cheatsheet {
        mockData.first { $0.id == id } ?? .placeholder
    }
}
