//
//  PreviewViewModel.swift
//  DevStack
//
//  Created by @ivansaul on 1/14/25.
//
//  https://github.com/ivansaul
//

import Foundation

extension CheatsheetsViewModel {
    static let preview: CheatsheetsViewModel = .init(
        cheatsheetsDataService: MockCheatsheetsDataService()
    )
}
