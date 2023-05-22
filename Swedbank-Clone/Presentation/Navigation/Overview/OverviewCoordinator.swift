//
//  OverviewCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation

class OverviewCoordinator: NavigationCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    var onFree: FreeCoodinatorClosure = {}
    var router: RouterProtocol
    var children: [NavigationCoordinator] = []
    
    func start() {
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .blue
        router.push(vc, isAnimated: true, onNavigateBack: onFree)
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }
}

// MARK: Private

extension AppCoordinator {
    
}
