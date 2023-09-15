//
//  LockedDashboardVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import SwedInterfaceAdapters

class LockedDashboardVC: UIViewController {
    
    private lazy var rootView = LockedDashboardView.RootView()
    private let viewModel: LockedDashboardVM
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: LockedDashboardVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.update(config: viewModel.presentation)
        bind()
    }
    
    private func bind() {
        rootView.didTapLoginButton
            .receiveOnMainThread()
            .sink { [weak self] in
                self?.viewModel.onLoginTapped()
            }
            .store(in: &bag)
    }
    
}
