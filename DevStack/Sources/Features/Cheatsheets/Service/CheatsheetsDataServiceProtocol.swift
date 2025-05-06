//
//  CheatsheetsDataServiceProtocol.swift
//  DevStack
//
//  Created by @ivansaul on 1/16/25.
//
//  https://github.com/ivansaul
//

import Foundation

protocol CheatsheetsDataServiceProtocol {
    func fetchCheatsheets() async throws -> [Cheatsheet]
    func fetchCheatsheet(byID id: String) async throws -> Cheatsheet
}
