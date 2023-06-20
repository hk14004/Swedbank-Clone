//
//  SettingsCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation
import DevToolsCore

class SettingsScreenCoordinatorImpl: SettingsScreenCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    weak var navigationController: UINavigationController?
    
    func start() {
        let vm = DI.container.resolve((any SettingsScreenVM).self, argument: self as SettingsScreenCoordinator)!
        let vc = DI.container.resolve(SettingsScreenVC.self, argument: vm)!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("")
    }
}

// MARK: Public

extension SettingsScreenCoordinatorImpl {
    func goToLanguage() {
        let vm = DI.container.resolve((any LanguageScreenVM).self)!
        let vc = DI.container.resolve(LanguageScreenVC.self, argument: vm)!
        
        vm.navigationBindings.onSelected = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
