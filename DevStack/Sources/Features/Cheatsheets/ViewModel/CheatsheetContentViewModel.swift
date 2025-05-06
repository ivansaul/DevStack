//
//  CheatsheetDetailViewModel.swift
//  DevStack
//
//  Created by @ivansaul on 5/3/25.
//
//  https://github.com/ivansaul
//

import Foundation

@Observable
final class CheatsheetContentViewModel {
    var showAlert: Bool = false
    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String = ""
    private(set) var cheatsheet: Cheatsheet = .placeholder

    private let sheetID: String
    private let cheatsheetsDataService: CheatsheetsDataServiceProtocol

    init(sheetID: String, cheatsheetsDataService: CheatsheetsDataServiceProtocol) {
        self.sheetID = sheetID
        self.cheatsheetsDataService = cheatsheetsDataService
    }

    @MainActor
    func fetchCheatSheet() async {
        guard !isLoading else { return }
        defer { isLoading = false }

        isLoading = true
        do {
            try Task.checkCancellation()
            cheatsheet = try await cheatsheetsDataService.fetchCheatsheet(byID: sheetID)
        } catch {
            loadError(error)
        }
    }
}

extension CheatsheetContentViewModel {
    @MainActor
    private func loadError(_ error: Error) {
        guard !(error is CancellationError) else { return }

        isLoading = false
        errorMessage = error.localizedDescription
        showAlert = true
    }
}
