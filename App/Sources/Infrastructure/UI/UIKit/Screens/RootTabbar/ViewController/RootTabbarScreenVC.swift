//
//  RootTabbarScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import Combine
import SwedInterfaceAdapters
import DevToolsLocalization
import DevToolsNavigation

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
        viewModel.viewDidLoad()
    }
}

extension RootTabbarScreenVC {
    private func startup() {
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        viewModel.tabsPublisher.receiveOnMainThread()
            .map { [weak self] tabs in
                self?.makeTabs(tabs: tabs)
            }
            .sink { [weak self] controllers in
                self?.viewControllers = controllers
            }
            .store(in: &bag)
    }
    
    private func makeTabs(tabs: [PresentableRootTab]) -> [UINavigationController] {
        tabs.map { tab in
            switch tab.type {
            case .overview:
                return makeOverViewTab(presentable: tab)
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
    
    private func makeOverViewTab(presentable: PresentableRootTab) -> UINavigationController {
        let navVC = UINavigationController()
        let item = RuntimeLocalizedTabBarItem()
        item.image = UIImage(systemName: presentable.unselectedImageName)!
        item.selectedImage = UIImage(systemName: presentable.selectedImageName)!
        item.runtimeLocalizedKey = presentable.nameKey
        navVC.tabBarItem = item
        
        let vc: UIViewController = {
            guard presentable.locked else {
                let factory: DashboardScreenFactory = Composition.resolve()
                return factory.make()
            }
            let factory: LockedTabScreenFactory = Composition.resolve()
            let vc = factory.make(
                config: LockedDashboardPresentationConfig(
                    title: "Screen.LockedTab.Overview.title",
                    subtitle: "Screen.LockedTab.Overview.subtitle",
                    backgroundColorName: "White3",
                    tabDescriptionIconName: "ic_overview_description"
                )
            )
            return vc
        }()
        
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
