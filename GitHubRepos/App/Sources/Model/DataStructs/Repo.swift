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
        case htmlUrl
    }
    
    struct Owner: Codable {
        let login: String
        var avatarUrl: String
    }
    
    let name: String
    let desc: String
    let fork: Bool
    let owner: Owner
    let htmlUrl: String
    
    var avatarUrl: String {
        owner.avatarUrl
    }
    
    var login: String {
        owner.login
    }
}
