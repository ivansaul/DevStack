//
//  CheatsheetsViewModel.swift
//  DevStack
//
//  Created by @ivansaul on 1/12/25.
//
//  https://github.com/ivansaul
//

import AsyncAlgorithms
import Combine
import Foundation

@Observable
final class CheatsheetsViewModel {
    private(set) var isLoading: Bool = false
    private(set) var showAlert: Bool = false
    private(set) var errorMessage: String = ""
    private(set) var cheatsheets: [Cheatsheet] = []
    private(set) var filteredCheatSheets: [Cheatsheet] = []

    var searchText: String = "" {
        didSet {
            searchTextContinuation.yield(searchText.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }

    private let cheatsheetsDataService: CheatsheetsDataServiceProtocol

    private let (searchTextStream, searchTextContinuation) = AsyncStream.makeStream(of: String.self)

    init(cheatsheetsDataService: CheatsheetsDataServiceProtocol) {
        self.cheatsheetsDataService = cheatsheetsDataService

        Task {
            await addSubscribersAsync()
        }
    }

    deinit {
        searchTextContinuation.finish()
    }

    @MainActor
    func fetchCheatSheets() async {
        guard !isLoading else { return }
        defer { isLoading = false }

        isLoading = true
        do {
            cheatsheets = try await cheatsheetsDataService.fetchCheatsheets()
            filterCheatSheets(by: searchText)
        } catch {
            loadError(error)
        }
    }
}

extension CheatsheetsViewModel {
    private func addSubscribersAsync() async {
        let stream = searchTextStream
            .removeDuplicates()
            .debounce(for: .milliseconds(300))

        for await text in stream {
            await filterCheatSheets(by: text)
        }
    }

    @MainActor
    private func filterCheatSheets(by text: String) {
        filteredCheatSheets = text.isEmpty
            ? cheatsheets
            : cheatsheets.filter {
                $0.title.lowercased()
                    .contains(text.lowercased())
            }
    }

    @MainActor
    private func loadError(_ error: Error) {
        isLoading = false
        errorMessage = error.localizedDescription
        showAlert = true
    }
}
