//
//  KeyValueStorageDataService.swift
//  DevStack
//
//  Created by @ivansaul on 4/5/25.
//
//  https://github.com/ivansaul
//

protocol KeyValueStorageDataService {
    func get<T: Codable>(forKey key: String, as type: T.Type) async -> T?
    func set<T: Codable>(_ value: T, forKey key: String) async
    func remove(forKey key: String) async
}
