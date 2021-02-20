//
//  EndPoint.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation

enum EndPoint: EndPointType {
    
    case remote
    case mock
    
    var url: URL? {
        switch self {
        case .remote: return URL(string: "https://api.github.com/orgs/xing/repos")
        case .mock: return URL(fileURLWithPath: Bundle.main.path(forResource: "MockData", ofType: "json") ?? "")
        }
    }
}
