//
//  ListViewModel.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import Foundation
import Combine

final class ListViewModel: ListCoordinatorInjected, ListModelInjected {
    
    @Published var items = [ListItem]()
    
    private var disposables: Set<AnyCancellable> = []
}

// Actions
extension ListViewModel {

    func get() {
        listModel.get()
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .map(transform)
            .assign(to: \.items, on: self)
            .store(in: &disposables)
    }
    
    func open(_ url: String) {
        listCoordinator.open(url)
    }
}

// MARK: - Helpers
private extension ListViewModel {
    func transform(_ items: [DataItem]) -> [ListItem] {
        items.map { item in
            ListItem(item)
        }
    }
}
