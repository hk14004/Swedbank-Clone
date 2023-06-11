//
//  PaymentsCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation

// MARK: TODO: Check and subcribe to auth status

class PaymentsCoordinator: NavigationCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    var onFree: FreeCoodinatorClosure = {}
    var router: RouterProtocol
    var children: [NavigationCoordinator] = []
    
    func start() {
        goToUnauthorisedScreen()
    }
    
    init(router: RouterProtocol) {
        self.router = router
    }
}

// MARK: Private

extension PaymentsCoordinator {
    private func goToUnauthorisedScreen() {
        let vm = LockedTabScreenVMImpl(tabDescriptionIconName: Asset.Images.Icons.icPaymentsDescription.name,
                                       title: "LockedTab.Payments.title",
                                       subtitle: "LockedTab.Payments.subtitle",
                                       backgroundColorName: Asset.Colors.color5.name)
        let view = LockedTabScreenView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        
        vm.navigationBindings.onLoggedIn = { [weak self] in
            self?.goToAuth()
        }
        
        router.navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: Public

extension PaymentsCoordinator {
    func goToAuth() {
        let coordinator = AuthorisationCoordinator(router: router)
        store(coordinator: coordinator)
        coordinator.start()
    }
}
