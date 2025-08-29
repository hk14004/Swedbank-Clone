//
//  RootTabbarScreenVC+Tabs.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 17/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import SwedApplication
import DevToolsLocalization
import SwedOverview
import SwedLogin
import SwedContacts

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
            }
        }
    }
    
    func makeLockedTab() -> UIViewController {
        let didUnlockDashboardPublisher = PassthroughSubject<Void, Never>()
        let factory: any LoginScreenFactory = Composition.resolve()
        let vc = factory.make(params: .init(customer: viewModel.customer, didLoginPublisher: didUnlockDashboardPublisher))
        didUnlockDashboardPublisher
            .receiveOnMainThread()
            .sink { [weak self] customer in
                self?.viewModel.didUnlock()
            }
            .store(in: &bag)
        return vc
    }
    
    private func makeLogoutFinishedPublisher() -> PassthroughSubject<Void, Never> {
        let publisher = PassthroughSubject<Void, Never>()
        publisher
            .receiveOnMainThread()
            .sink { [weak self] in
                self?.viewModel.router.routeToSplashScreen()
            }
            .store(in: &bag)
        return publisher
    }
    
    private func onLaunchProfileFlow(customer: Customer) {
        let factory: any ProfileScreenFactory = Composition.resolve()
        let vc = factory.make(
            params: .init(
                customer: customer,
                logoutFinished: makeLogoutFinishedPublisher()
            )
        )
        viewControllers?.first?.present(vc, animated: true)
    }
    
    private func makeOverviewTab(locked: Bool) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: "house")
        item.selectedImage = UIImage(systemName: "house.fill")
        item.runtimeLocalizedKey = AppStrings.Tabbar.Tabs.Overview.titleKey
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            if !locked {
                let factory: any OverviewScreenFactory = Composition.resolve()
                return factory.make(
                    params: .init(
                        customer: viewModel.customer,
                        onLaunchProfileIntent: { [weak self] in
                            DispatchQueue.main.async {
                                guard let self else { return }
                                self.onLaunchProfileFlow(customer: self.viewModel.customer)
                            }
                        }
                    )
                )
            } else {
                return makeLockedTab()
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
            return makeLockedTab()
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
            return makeLockedTab()
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
            return factory.make(params: .init())
        }()
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
}
