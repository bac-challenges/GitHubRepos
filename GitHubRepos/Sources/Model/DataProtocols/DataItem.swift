//
//  DataItem.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation

protocol DataItem {
    var name: String { get }
    var desc: String { get }
    var fork: Bool { get }
    var login: String { get }
    var htmlUrl: String { get }
}
