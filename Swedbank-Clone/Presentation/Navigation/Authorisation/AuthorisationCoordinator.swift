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
        goToAuth()
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }
}

// MARK: Private

extension AuthorisationCoordinator {
    private func goToAuth() {
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .red
        router.navigationController.present(vc, animated: true)
    }
}
