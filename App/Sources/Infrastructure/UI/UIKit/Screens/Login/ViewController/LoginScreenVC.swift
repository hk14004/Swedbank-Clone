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
    
    private let viewModel: LoginScreenVM
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
        bind()
        viewModel.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        rootView.onLoginTap
            .receiveOnMainThread()
            .sink { [weak self] in
                self?.viewModel.onLoginTapped(
                    username: self?.rootView.usernameValue ?? "",
                    password: self?.rootView.passwordValue ?? ""
                )
            }
            .store(in: &bag)
    }
    
}
