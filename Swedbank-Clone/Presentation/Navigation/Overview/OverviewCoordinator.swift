//
//  OverviewCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation

// MARK: TODO: Check and subcribe to auth status

class OverviewCoordinator: NavigationCoordinator {
    
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

extension OverviewCoordinator {
    private func goToUnauthorisedScreen() {
        let vm = LockedTabScreenVMImpl(tabDescriptionIconName: Asset.Images.Icons.icOverviewDescription.name,
                                       title: "LockedTab.Overview.title",
                                       subtitle: "LockedTab.Overview.subtitle",
                                       backgroundColorName: Asset.Colors.color4.name)
        let view = LockedTabScreenView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        
        vm.navigationBindings.onLoggedIn = { [weak self] in
            self?.goToAuth()
        }
        vm.navigationBindings.onGoToLanguageChange = { [weak self] in
            self?.goToLanguageSelection()
        }
        
        router.navigationController.setViewControllers([vc], animated: false)
    }
}

// MARK: Public

extension OverviewCoordinator {
    func goToAuth() {
        let coordinator = AuthorisationCoordinator(router: router)
        store(coordinator: coordinator)
        coordinator.start()
    }
    
    func goToLanguageSelection() {
        let vm = LanguageSelectionScreenBottomSheetVMImpl()
        let view = LanguageSelectionScreenBottomSheetView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        
        // TODO: Check mem leak
        vm.navigationBindings.onClose = {
            vc.dismiss(animated: true)
        }
        
        router.navigationController.present(vc, animated: true)
    }
}
