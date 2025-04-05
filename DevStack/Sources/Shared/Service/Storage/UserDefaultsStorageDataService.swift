//
//  UserDefaultsStorageDataService.swift
//  DevStack
//
//  Created by @ivansaul on 4/5/25.
//
//  https://github.com/ivansaul
//

import Foundation

class UserDefaultsStorageDataService: KeyValueStorageDataService {
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func get<T>(forKey key: String, as type: T.Type) async -> T? where T: Codable {
        guard let data = defaults.data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(type, from: data)
    }

    func set<T>(_ value: T, forKey key: String) async where T: Codable {
        if let data = try? JSONEncoder().encode(value) {
            defaults.set(data, forKey: key)
        }
    }

    func remove(forKey key: String) async {
        defaults.removeObject(forKey: key)
    }
}
