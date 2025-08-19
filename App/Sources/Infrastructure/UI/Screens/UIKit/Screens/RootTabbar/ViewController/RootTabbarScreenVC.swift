//
//  RootTabbarScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import Combine
import DevToolsLocalization
import DevToolsNavigation
import SwedApplicationBusinessRules

class RootTabbarScreenVC: UITabBarController {
    // MARK: Properties
    let viewModel: RootTabbarScreenVM
    var bag = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    init(viewModel: RootTabbarScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.viewDidLoad()
    }
}

// MARK: Private
extension RootTabbarScreenVC {
    private func setup() {
        dropShadow()
        bindOutput()
    }
    
    private func bindOutput() {
        viewModel.tabsPublisher
            .receiveOnMainThread()
            .map { [weak self] tabs in
                self?.makeTabs(tabs: tabs)
            }
            .sink { [weak self] controllers in
                self?.viewControllers = controllers
            }
            .store(in: &bag)
    }
    
    private func dropShadow() {
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIConstant.Tabbar.shadowColor.cgColor
        tabBar.layer.shadowOpacity = UIConstant.Tabbar.shadowOpacity
        tabBar.layer.shadowRadius = UIConstant.Tabbar.shadowRadius
        tabBar.layer.shadowOffset = UIConstant.Tabbar.shadowOffset
    }
}
