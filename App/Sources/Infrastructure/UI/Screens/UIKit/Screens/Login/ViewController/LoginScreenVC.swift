//
//  LoginScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI
import Combine
import SwedInterfaceAdapters

class LoginScreenVC: UIViewController {
    
    let viewModel: LoginScreenVM
    private lazy var rootView = LoginScreenView.RootView()
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: LoginScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindActions()
        bindOutput()
        viewModel.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindOutput() {
        bindIsLoading()
    }
    
    private func bindActions() {
        bindLoginTappedAction()
    }
    
    private func bindIsLoading() {
        viewModel.loadingPublisher
            .receiveOnMainThread()
            .sink { [weak self] loading in
                guard let self = self else { return }
                rootView.configure(loading: loading)
            }
            .store(in: &bag)
    }
    
    private func bindLoginTappedAction() {
        rootView.onLoginTap
            .receiveOnMainThread()
            .sink { [weak self] in
                guard let self = self else { return }
                viewModel.onLoginTapped(
                    username: rootView.usernameValue,
                    password: rootView.passwordValue
                )
            }
            .store(in: &bag)
    }
}
