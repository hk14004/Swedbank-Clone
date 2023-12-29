//
//  RootTabbarScreenVC+Tabs.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import Combine
import SwedApplicationBusinessRules
import DevToolsLocalization

extension RootTabbarScreenVC {
    func makeTabs(tabs: [RootTab]) -> [UINavigationController] {
        tabs.map { tab in
            switch tab {
            case .overview:
                return makeOverviewTab(locked: viewModel.lockedPublisher.value)
            case .payments:
                return makePaymentsTab(locked: viewModel.lockedPublisher.value)
            case .cards:
                return makeCardsTab(locked: viewModel.lockedPublisher.value)
            case .contacts:
                return makeContactsTab(locked: viewModel.lockedPublisher.value)
            case .services:
                return makeServicesTab(locked: viewModel.lockedPublisher.value)
            }
        }
    }
    
    private func makeLockedTab(config: LockedDashboardPresentationConfig) -> UIViewController {
        let didUnlockDashboardPublisher = PassthroughSubject<CustomerDTO, Never>()
        let factory: LockedTabScreenFactory = Composition.resolve()
        let vc = factory.make(
            config: config,
            didUnlockDashboardPublisher: didUnlockDashboardPublisher
        )
        didUnlockDashboardPublisher
            .receiveOnMainThread()
            .sink { [weak self] customer in
                self?.viewModel.didUnlock(customer: customer)
            }
            .store(in: &bag)
        return vc
    }
    
    private func makeOverviewTab(locked: Bool) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: "house")
        item.selectedImage = UIImage(systemName: "house")
        item.runtimeLocalizedKey = "Tabbar.Tabs.Overview.title"
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard locked else {
                let factory: OverviewScreenFactory = Composition.resolve()
                return factory.make()
            }
            let config = LockedDashboardPresentationConfig(
                title: "Screen.LockedTab.Overview.title",
                subtitle: "Screen.LockedTab.Overview.subtitle",
                backgroundColorName: "White3",
                tabDescriptionIconName: "ic_overview_description"
            )
            return makeLockedTab(config: config)
        }()
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makePaymentsTab(locked: Bool) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: "arrow.left.arrow.right")
        item.selectedImage = UIImage(systemName: "arrow.left.arrow.right")
        item.runtimeLocalizedKey = "Tabbar.Tabs.Payments.title"
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard locked else {
                let vc = UIViewController()
                vc.view.backgroundColor = .gray
                return vc
            }
            let config = LockedDashboardPresentationConfig(
                title: "Screen.LockedTab.Payments.title",
                subtitle: "Screen.LockedTab.Payments.subtitle",
                backgroundColorName: "Pink1",
                tabDescriptionIconName: "ic_payments_description"
            )
            return makeLockedTab(config: config)
        }()
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makeCardsTab(locked: Bool) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: "creditcard")
        item.selectedImage = UIImage(systemName: "creditcard")
        item.runtimeLocalizedKey = "Tabbar.Tabs.Cards.title"
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard locked else {
                let vc = UIViewController()
                vc.view.backgroundColor = .gray
                return vc
            }
            let config = LockedDashboardPresentationConfig(
                title: "Screen.LockedTab.Cards.title",
                subtitle: "Screen.LockedTab.Cards.subtitle",
                backgroundColorName: "White3",
                tabDescriptionIconName: "ic_cards_description"
            )
            return makeLockedTab(config: config)
        }()
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makeServicesTab(locked: Bool) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: "list.clipboard")
        item.selectedImage = UIImage(systemName: "list.clipboard")
        item.runtimeLocalizedKey = "Tabbar.Tabs.Services.title"
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard locked else {
                let vc = UIViewController()
                vc.view.backgroundColor = .gray
                return vc
            }
            let config = LockedDashboardPresentationConfig(
                title: "Screen.LockedTab.Services.title",
                subtitle: "Screen.LockedTab.Services.subtitle",
                backgroundColorName: "Pink1",
                tabDescriptionIconName: "ic_services_description"
            )
            return makeLockedTab(config: config)
        }()
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makeContactsTab(locked: Bool) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: "bubble.left.and.bubble.right")
        item.selectedImage = UIImage(systemName: "bubble.left.and.bubble.right")
        item.runtimeLocalizedKey = "Tabbar.Tabs.Contacts.title"
        navVC.tabBarItem = item
        
        let vc = UIViewController()
        vc.view.backgroundColor = .gray
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
}
