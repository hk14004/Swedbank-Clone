//
//  AppCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import SwiftUI
import DevToolsNavigation

class AppCoordinator: NavigationCoordinator {
    
    // MARK: Properties
    
    private let window: UIWindow
    
    // Coordinator
    var navigationController: UINavigationController?
    var children: [NavigationCoordinator] = []
    
    func start() {
        navigationController?.navigationBar.isHidden = true
        window.rootViewController = navigationController
        goToInitialScreen()
        window.makeKeyAndVisible()
    }
    
    init(window: UIWindow) {
        self.window = window
        navigationController = .init()
    }
}

// MARK: Private

extension AppCoordinator {
    private func goToInitialScreen() {
        goToRoot()
    }
    
    private func goToRoot() {
        let coordinator = DI.container.resolve(TabBarCoordinator.self, argument: navigationController!)!
        children.append(coordinator)
        coordinator.start()
    }
}
