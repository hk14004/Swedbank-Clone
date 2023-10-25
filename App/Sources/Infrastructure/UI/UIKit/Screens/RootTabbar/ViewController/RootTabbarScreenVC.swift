//
//  RootTabbarScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import SwedInterfaceAdapters

class RootTabbarScreenVC: UITabBarController {
    
    private let viewModel: RootTabbarScreenVM
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: RootTabbarScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startup()
    }
}

extension RootTabbarScreenVC {
    private func startup() {
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        viewModel.tabs.receiveOnMainThread()
            .map { [weak self] tabs in
                self?.makeTabs(tabs: tabs)
            }
            .sink { [weak self] controllers in
                self?.viewControllers = controllers
            }
            .store(in: &bag)
    }
    
    private func makeTabs(tabs: [DashboardTab]) -> [UINavigationController] {
        tabs.map { tab in
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
        let item = UITabBarItem()
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "house")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "house")!
        let config = LockedDashboardPresentationConfig(
            title: "title",
            subtitle: "sub",
            backgroundColorName: "Content1",
            tabDescriptionIconName: ""
        )
        let vc = Composition.shared.container.resolve(
            LockedDashboardVC.self, argument: config
        )!
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makePaymentsTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = UITabBarItem()
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "house")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "house")!
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makeCardsTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = UITabBarItem()
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "house")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "house")!
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makeServicesTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = UITabBarItem()
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "house")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "house")!
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
    
    private func makeContactsTab() -> UINavigationController {
        let navVC = UINavigationController()
        let item = UITabBarItem()
        navVC.tabBarItem = item
        navVC.tabBarItem.image = UIImage(systemName: "house")!
        navVC.tabBarItem.selectedImage = UIImage(systemName: "house")!
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        navVC.setViewControllers([vc], animated: false)
        return navVC
    }
}
