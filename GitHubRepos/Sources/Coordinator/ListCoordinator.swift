//
//  ListCoordinator.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit

final class ListCoordinator: Coordinator, NavControllerInjected, ListControllerInjected {
    func start() {
        navController.pushViewController(listController, animated: false)
    }
}
