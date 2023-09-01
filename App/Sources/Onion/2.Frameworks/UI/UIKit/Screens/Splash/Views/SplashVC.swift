//
//  SplashViewController.swift
//  SWED LV
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    // MARK: Properties
    
    private let viewModel: SplashVM
    private lazy var rootView = SplashView.RootView()
    
    // MARK: Lifecycle
    
    init(viewModel: SplashVM) {
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
        viewModel.onViewDidLoad()
    }
    
}
