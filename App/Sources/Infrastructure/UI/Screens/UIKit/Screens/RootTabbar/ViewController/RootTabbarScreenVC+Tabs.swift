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
        item.selectedImage = UIImage(systemName: "house.fill")
        item.runtimeLocalizedKey = AppStrings.Tabbar.Tabs.Overview.titleKey
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            if let customer = viewModel.customer {
                let factory: OverviewScreenFactory = Composition.resolve()
                return factory.make(customer: customer)
            } else {
                let config = LockedDashboardPresentationConfig(
                    title: AppStrings.Screen.LockedTab.Overview.titleKey,
                    subtitle: AppStrings.Screen.LockedTab.Overview.subtitleKey,
                    backgroundColorName: "White3",
                    tabDescriptionIconName: "ic_overview_description"
                )
                return makeLockedTab(config: config)
            }
        }()
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makePaymentsTab(locked: Bool) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: "arrow.up.left.arrow.down.right.square")
        item.selectedImage = UIImage(systemName: "arrow.up.left.arrow.down.right.square.fill")
        item.runtimeLocalizedKey = AppStrings.Tabbar.Tabs.Payments.titleKey
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard locked else {
                let vc = UIViewController()
                vc.view.backgroundColor = .gray
                return vc
            }
            let config = LockedDashboardPresentationConfig(
                title: AppStrings.Screen.LockedTab.Payments.titleKey,
                subtitle: AppStrings.Screen.LockedTab.Payments.subtitleKey,
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
        item.selectedImage = UIImage(systemName: "creditcard.fill")
        item.runtimeLocalizedKey = AppStrings.Tabbar.Tabs.Cards.titleKey
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard locked else {
                let vc = UIViewController()
                vc.view.backgroundColor = .gray
                return vc
            }
            let config = LockedDashboardPresentationConfig(
                title: AppStrings.Screen.LockedTab.Cards.titleKey,
                subtitle: AppStrings.Screen.LockedTab.Cards.subtitleKey,
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
        item.image = UIImage(systemName: "shippingbox")
        item.selectedImage = UIImage(systemName: "shippingbox.fill")
        item.runtimeLocalizedKey = AppStrings.Tabbar.Tabs.Services.titleKey
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard locked else {
                let vc = UIViewController()
                vc.view.backgroundColor = .gray
                return vc
            }
            let config = LockedDashboardPresentationConfig(
                title: AppStrings.Screen.LockedTab.Services.titleKey,
                subtitle: AppStrings.Screen.LockedTab.Services.subtitleKey,
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
        item.selectedImage = UIImage(systemName: "bubble.left.and.bubble.right.fill")
        item.runtimeLocalizedKey = AppStrings.Tabbar.Tabs.Contacts.titleKey
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            let factory: ContactsScreenFactory = Composition.resolve()
            return factory.make()
        }()
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
}
