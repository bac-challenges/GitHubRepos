//
//  ConfigurableCell.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation

public protocol ConfigurableCell {
    associatedtype T
    func configure(_ item: T)
}
