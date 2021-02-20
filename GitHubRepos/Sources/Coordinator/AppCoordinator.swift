//
//  AppCoordinator.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit

protocol AppCoordinatorType: Coordinator {
    func open(_ url: String)
}

final class AppCoordinator: AppCoordinatorType, WindowInjected, NavControllerInjected, ListCoordinatorInjected {
    func start() {
        window.makeKeyAndVisible()
        window.rootViewController = navController
        window.tintColor = .darkGray
        listCoordinator.start()
    }
    
    func open(_ url: String) {
        guard let url =  URL(string: url) else {
            print("Can't open URL")
            return
        }
        
        let alert = UIAlertController(title: nil, message: "Open external link in Safari", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel))
        alert.addAction(UIAlertAction(title: "Open", style: UIAlertAction.Style.default) { _ in
            UIApplication.shared.open(url)
        })
        
        window.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
