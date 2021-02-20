//
//  ListItem.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation

struct ListItem {
    
    let name: String
    let desc: String
    let fork: Bool
    let login: String
    
    init(_ repo: DataItem) {
        name = repo.name
        desc = repo.desc
        fork = repo.fork
        login = repo.login
    }
}
