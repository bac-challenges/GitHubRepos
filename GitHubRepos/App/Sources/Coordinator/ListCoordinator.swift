//
//  ListCoordinator.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit

protocol ListCoordinatorType: Coordinator, AppCoordinatorInjected {
    func open(_ url: String)
}

final class ListCoordinator: ListCoordinatorType, NavControllerInjected, ListControllerInjected {
    
    func open(_ url: String) {
        appCoordinator.open(url)
    }
    
    func start() {
        navController.pushViewController(listController, animated: false)
    }
}
