//
//  OverviewCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import SwiftUI
import DevToolsNavigation
import DevToolsCore

// MARK: TODO: Check and subcribe to auth status

class OverviewCoordinator: NavigationCoordinator {
    
    // MARK: Properties
        
    // Coordinator
    weak var navigationController: UINavigationController?
    var children: [NavigationCoordinator] = []
    
    let manager = DI.container.resolve(BaseUserSessionManager<SwedbankUserSessionCredentials>.self)!
    
    func start() {
        if manager.isSomebodyLoggedIn() {
            goToauthorisedScreen()   
        } else {
            goToUnauthorisedScreen()
        }
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
//        children.forEach({$0.onFree?()})
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
        
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    private func goToauthorisedScreen() {
        let vm = DI.container.resolve((any OverviewScreenVM).self)!
        let vc = DI.container.resolve(OverviewScreenVC.self, argument: vm)!
        navigationController?.setViewControllers([vc], animated: false)
    }
}

// MARK: Public

extension OverviewCoordinator {
    func goToAuth() {
        let coordinator = AuthorisationCoordinator(navigationController: navigationController!)
        coordinator.start()
    }
    
    func goToLanguageSelection() {
        let vm = DI.container.resolve((any LanguageSelectionScreenBottomSheetVM).self)! as! LanguageSelectionScreenBottomSheetVMImpl
        let view = LanguageSelectionScreenBottomSheetView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        
        vm.navigationBindings.onClose = { [weak vc] in
            vc?.dismiss(animated: true)
        }
        
        navigationController?.present(vc, animated: true)
    }
}
