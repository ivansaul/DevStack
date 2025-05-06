//
//  CheatsheetsDataService.swift
//  DevStack
//
//  Created by @ivansaul on 1/16/25.
//
//  https://github.com/ivansaul
//

import Foundation

class CheatsheetsDataService: CheatsheetsDataServiceProtocol, HTTPNetworking {
    func fetchCheatsheets() async throws -> [Cheatsheet] {
        let resource = CheatsheetsResource()
        let request = try resource.urlRequest()
        let data = try await fetchData(for: request)
        return try decodeData(as: [Cheatsheet].self, data: data)
    }

    func fetchCheatsheet(byID id: String) async throws -> Cheatsheet {
        let resource = CheatsheetResource(id: id)
        let request = try resource.urlRequest()
        let data = try await fetchData(for: request)
        return try decodeData(as: Cheatsheet.self, data: data)
    }
}
