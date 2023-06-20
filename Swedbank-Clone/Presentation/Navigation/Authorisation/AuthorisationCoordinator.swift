//
//  AuthorisationCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation

class AuthorisationCoordinator: NavigationCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    weak var navigationController: UINavigationController?
    var children: [NavigationCoordinator] = []
    
    func start() {
        let vm = DI.container.resolve((any LoginScreenVM).self)!
        let vc = DI.container.resolve(LoginScreenVC.self, argument: vm)!
        vm.navigationBindings.onLoggedIn = { [weak vc] in
            DispatchQueue.main.async {
                vc?.dismiss(animated: true)
            }
        }
        navigationController?.present(vc, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
//        children.forEach({$0.onFree?()})
    }
}

// MARK: Private

extension AuthorisationCoordinator {

}
