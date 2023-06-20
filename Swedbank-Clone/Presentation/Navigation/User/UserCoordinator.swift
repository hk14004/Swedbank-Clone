//
//  UserCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation
import DevToolsCore

class UserCoordinator: NavigationCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    weak var navigationController: UINavigationController?
        
    var children: [NavigationCoordinator] = []
    
    func start() {
        let vm = DI.container.resolve((any UserScreenVM).self)!
        let vc = DI.container.resolve(UserScreenVC.self, argument: vm)!
        vc.coordinator = self
        vm.navigationBindings.onSettings = { [weak self] in
            self?.goToSettings()
        }
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("")
    }
}

// MARK: Private

extension UserCoordinator {

}

// MARK: Public

extension UserCoordinator {
    func goToSettings() {
        let c = DI.container.resolve(SettingsScreenCoordinatorImpl.self, argument: navigationController!)!
        c.start()
    }
}
