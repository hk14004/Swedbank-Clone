//
//  SettingsCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation
import DevToolsCore

class SettingsCoordinator: NavigationCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    var onFree: FreeCoodinatorClosure = {}
    var router: RouterProtocol
    var children: [NavigationCoordinator] = []
    
    func start() {
        let vm = DI.container.resolve((any SettingsScreenVM).self)!
        vm.navigationBindings.onLanguage = { [weak self] in
            self?.goToLanguageSelect()
        }
        let vc = DI.container.resolve(SettingsScreenVC.self, argument: vm)!
        router.push(vc, isAnimated: true, onNavigateBack: onFree)
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    deinit {
        print("")
    }
}

// MARK: Private

extension SettingsCoordinator {
    
}

// MARK: Public

extension SettingsCoordinator {
    func goToLanguageSelect() {
        let vm = DI.container.resolve((any LanguageScreenVM).self)!
        let vc = DI.container.resolve(LanguageScreenVC.self, argument: vm)!
        
        vm.navigationBindings.onSelected = { [weak self] in
            self?.router.pop(true)
            self?.onFree?()
        }
        
        router.push(vc, isAnimated: true, onNavigateBack: onFree)
    }
}
