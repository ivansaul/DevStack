//
//  CheatsheetsResources.swift
//  DevStack
//
//  Created by @ivansaul on 5/3/25.
//
//  https://github.com/ivansaul
//

import Foundation

struct CheatsheetsResource: HTTPResource {
    let baseURL: String = "https://dev-stack-docs.pages.dev/api/v1"
    
    let path: String? = "/cheatsheets.json"
    
    let method: HTTPMethod = .GET
    
    let headers: [String: String]? = [
        "accept": "application/json",
    ]
    
    let query: [String: Any]? = nil
     
    let body: [String: Any]? = nil
}

struct CheatsheetResource: HTTPResource {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    let baseURL: String = "https://dev-stack-docs.pages.dev/api/v1"
    
    var path: String? {
        "/cheatsheets/\(id).json"
    }
    
    let method: HTTPMethod = .GET
    
    let headers: [String: String]? = [
        "accept": "application/json",
    ]
    
    let query: [String: Any]? = nil
     
    let body: [String: Any]? = nil
}
