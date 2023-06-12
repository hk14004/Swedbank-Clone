//
//  OverviewScreenVC.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import UIKit

class OverviewScreenVC: UIViewController {
    
    // MARK: Init
    
    init(viewModel: any OverviewScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    
    let viewModel: any OverviewScreenVM
    private var mainNavigationBar: MainNavigationBarView = {
        let v = MainNavigationBarView()
        v.runtimeLocalizedTitleKey = "Tabbar.Tabs.Payments.title"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func loadView() {
        super.loadView()
        loadMainNavigationBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainNavigationBar.updateTitle(key: "Tabbar.Tabs.Payments.title")
    }
    
}

// MARK: Private

extension OverviewScreenVC {
    private func loadMainNavigationBarView() {
        view.addSubview(mainNavigationBar)
        mainNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainNavigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainNavigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainNavigationBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
