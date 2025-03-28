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
    func fetchCheatsheets() async throws -> [Cheatsheet] {
        [Cheatsheet].preview
    }
}
