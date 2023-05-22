//
//  TabBarCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import DevToolsNavigation
import UIKit

final class TabBarCoordinator: NSObject, NavigationCoordinator {
    
    // MARK: Types
    
    enum Tab: Int, CaseIterable {
        case overview = 0
        case payments
        case cards
        case services
        case contacts
    }
    
    // MARK: Properties
    
    let tabController = UITabBarController(nibName: nil, bundle: nil)
    
    // Coordinator
    var onFree: FreeCoodinatorClosure = {}
    var router: RouterProtocol
    var children: [NavigationCoordinator] = []
        
    // MARK: Coordinator
    
    func start() {
        tabController.viewControllers = makeTabs()
        select(tab: .overview)
        router.navigationController.setViewControllers([tabController], animated: true)
    }
    
    init(router: RouterProtocol) {
        self.router = router
        super.init()
    }
}

// MARK: Public

extension TabBarCoordinator {
    func select(tab: Tab) {
        tabController.selectedIndex = tab.rawValue
    }
}

// MARK: Private

extension TabBarCoordinator {
        
    private func makeTabs() -> [UINavigationController] {
        Tab.allCases.map { tab in
            switch tab {
            case .overview:
                return makeOverViewTab()
            case .payments:
                return makeOverViewTab()
            case .cards:
                return makeOverViewTab()
            case .contacts:
                return makeOverViewTab()
            case .services:
                return makeOverViewTab()
            }
        }
    }
    
    private func makeOverViewTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = UITabBarItem()
        navVC.tabBarItem = item
//        navVC.tabBarItem.image = UIImage(named: "ic_house")!
//        navVC.tabBarItem.selectedImage = UIImage(named: "ic_house_selected")!
        let router = Router(navigationController: navVC)
        let coordinator = OverviewCoordinator(router: router)
        children.append(coordinator)
        coordinator.start()
        return navVC
    }
    
}
