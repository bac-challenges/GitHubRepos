//
//  AppDelegate.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AppCoordinatorInjected {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        return true
    }
}

