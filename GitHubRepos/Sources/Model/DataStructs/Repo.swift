//
//  Repo.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation

struct Repo: Codable, DataItem {
    
    enum CodingKeys: String, CodingKey {
        case name
        case desc = "description"
        case fork
        case owner
    }
    
    struct Owner: Codable {
        let login: String
    }
    
    let name: String
    let desc: String
    let fork: Bool
    let owner: Owner
    
    var login: String {
        owner.login
    }
}
