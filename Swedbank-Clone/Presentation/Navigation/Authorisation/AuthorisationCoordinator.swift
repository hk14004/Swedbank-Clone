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
    var onFree: FreeCoodinatorClosure = {}
    var router: RouterProtocol
    var children: [NavigationCoordinator] = []
    
    func start() {
        let vm = LoginScreenVMImpl()
        let vc = LoginScreenVC.instantiateViewController { coder in
            LoginScreenVC(coder: coder, viewModel: vm)!
        }!
        vm.navigationBindings.onLoggedIn = { [weak vc] in
            DispatchQueue.main.async {
                vc?.dismiss(animated: true)
            }
        }
        router.navigationController.present(vc, animated: true)
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }
}

// MARK: Private

extension AuthorisationCoordinator {

}
