//
//  AppCoordinator.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit

final class AppCoordinator: Coordinator, WindowInjected, NavControllerInjected, ListCoordinatorInjected {
    func start() {
        window.makeKeyAndVisible()
        window.rootViewController = navController
        window.tintColor = .darkGray
        listCoordinator.start()
    }
}
