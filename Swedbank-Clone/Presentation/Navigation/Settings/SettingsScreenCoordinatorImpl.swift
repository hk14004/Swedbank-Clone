//
//  SettingsCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation
import DevToolsCore

class SettingsScreenCoordinator: NavigationCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    weak var navigationController: UINavigationController?
    
    func start() {
        let vm = DI.container.resolve((any SettingsScreenVM).self)!
        let vc = DI.container.resolve(SettingsScreenVC.self, argument: vm)!
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        vm.navigationBindings.onLanguage = { [weak self] in
            self?.goToLanguage()
        }
        // TODO: Bring back navigation bindings to vm and store shit coordinator in vc
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("")
    }
}

// MARK: Public

extension SettingsScreenCoordinator {
    func goToLanguage() {
        let vm = DI.container.resolve((any LanguageScreenVM).self)!
        let vc = DI.container.resolve(LanguageScreenVC.self, argument: vm)!
        
        vm.navigationBindings.onSelected = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
