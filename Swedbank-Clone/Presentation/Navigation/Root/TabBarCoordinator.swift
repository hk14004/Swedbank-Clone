//
//  TabBarCoordinator.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 22/05/2023.
//

import DevToolsNavigation
import UIKit
import DevToolsLocalization

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
    
    let tabController = AppTabBarController()
    
    // Coordinator
    var navigationController: UINavigationController?
    var children: [NavigationCoordinator] = []
        
    // MARK: Coordinator
    
    func start() {
        tabController.view.backgroundColor = .systemBackground
        tabController.viewControllers = makeTabs()
        select(tab: .overview)
        navigationController?.setViewControllers([tabController], animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
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
                return makePaymentsTab()
            case .cards:
                return makeCardsTab()
            case .contacts:
                return makeContactsTab()
            case .services:
                return makeServicesTab()
            }
        }
    }
    
    private func makeOverViewTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.runtimeLocalizedKey = L10n.Tabbar.Tabs.Overview.title
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "house")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "house")!
        let coordinator = DI.container.resolve(OverviewCoordinator.self, argument: navVC)!
        children.append(coordinator)
        coordinator.start()
        return navVC
    }
    
    private func makePaymentsTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.runtimeLocalizedKey = L10n.Tabbar.Tabs.Payments.title
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "arrow.left.arrow.right")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "arrow.left.arrow.right")!
        let coordinator = DI.container.resolve(PaymentsCoordinator.self, argument: navVC)!
        children.append(coordinator)
        coordinator.start()
        return navVC
    }
    
    private func makeCardsTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.runtimeLocalizedKey = L10n.Tabbar.Tabs.Cards.title
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "creditcard")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "creditcard")!
        let coordinator = DI.container.resolve(PaymentsCoordinator.self, argument: navVC)!
        children.append(coordinator)
        coordinator.start()
        return navVC
    }
    
    private func makeServicesTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.runtimeLocalizedKey = L10n.Tabbar.Tabs.Services.title
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "list.clipboard")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "list.clipboard")!
        let coordinator = DI.container.resolve(PaymentsCoordinator.self, argument: navVC)!
        children.append(coordinator)
        coordinator.start()
        return navVC
    }
    
    private func makeContactsTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.runtimeLocalizedKey = L10n.Tabbar.Tabs.Contacts.title
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "bubble.left.and.bubble.right")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "bubble.left.and.bubble.right")!
        let coordinator = DI.container.resolve(PaymentsCoordinator.self, argument: navVC)!
        children.append(coordinator)
        coordinator.start()
        return navVC
    }
}
