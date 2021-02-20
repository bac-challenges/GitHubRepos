//
//  EndPoint.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation

enum EndPoint: EndPointType {
    
    case remote
    
    var url: URL? {
        switch self {
        case .remote: return URL(string: "https://api.github.com/orgs/xing/repos")
        }
    }
}
