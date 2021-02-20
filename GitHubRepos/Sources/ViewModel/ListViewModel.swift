//
//  ListViewModel.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation
import Combine

final class ListViewModel: ListModelInjected {
    
    @Published var items = [ListItem]()
    
    private var disposables: Set<AnyCancellable> = []
    
    func get() {
        listModel.get()
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .map(transform)
            .assign(to: \.items, on: self)
            .store(in: &disposables)
    }
}

// MARK: - Helpers
private extension ListViewModel {
    func transform(_ items: [Repo]) -> [ListItem] {
        items.map { item in
            ListItem(item)
        }
    }
}
