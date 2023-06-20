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
    var onFree: FreeCoodinatorClosure = {}
    var router: RouterProtocol
    var children: [NavigationCoordinator] = []
    
    func start() {
        goToUserScreen()
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    deinit {
        print("")
    }
}

// MARK: Private

extension UserCoordinator {
    private func goToUserScreen() {
        let vm = DI.container.resolve((any UserScreenVM).self)!
        let vc = DI.container.resolve(UserScreenVC.self, argument: vm)!
        vm.navigationBindings.onSettings = { [weak self] in
            self?.goToSettings()
        }
        router.navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: Public

extension UserCoordinator {
    func goToSettings() {
        let c = DI.container.resolve(SettingsCoordinator.self, argument: router)!
        store(coordinator: c)
        c.start()
    }
}
