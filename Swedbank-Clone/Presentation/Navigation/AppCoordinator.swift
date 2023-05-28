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
    var onFree: FreeCoodinatorClosure = {}
    var router: RouterProtocol
    var children: [NavigationCoordinator] = []
    
    func start() {
        router.navigationController.navigationBar.isHidden = true
        window.rootViewController = router.navigationController
        goToInitialScreen()
    }
    
    init(window: UIWindow) {
        self.window = window
        router = Router(navigationController: .init())
    }
}

// MARK: Private

extension AppCoordinator {
    private func goToInitialScreen() {
        goToRoot()
    }
    
    private func goToOnboarding() {
//        let coordinator = CategoriesCoordinator(router: router)
//        store(coordinator: coordinator)
//        coordinator.start()
//        let vModel = WelcomeScreenVMImpl()
//        let view = WelcomeScreenView(viewModel: vModel)
//        let vController = UIHostingController(rootView: view)
//        router.push(vController, isAnimated: true, onNavigateBack: nil)
    }
    
    private func goToRoot() {
        let coordinator = TabBarCoordinator(router: router)
        store(coordinator: coordinator)
        coordinator.start()
    }
}
