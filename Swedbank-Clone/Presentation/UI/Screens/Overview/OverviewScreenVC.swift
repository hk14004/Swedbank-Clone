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
    private var mainNavigationBarView = MainNavigationBarView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startup()
    }
    
}

// MARK: Private

extension OverviewScreenVC {
    
    private func startup() {
        configureMainNavigationBarView()
    }
    
    private func configureMainNavigationBarView() {
        view.addSubview(mainNavigationBarView)
        mainNavigationBarView.translatesAutoresizingMaskIntoConstraints = false
        mainNavigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainNavigationBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainNavigationBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainNavigationBarView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        mainNavigationBarView.updateTitle(key: "Tabbar.Tabs.Overview.title")
        mainNavigationBarView.viewDidLoad()
        mainNavigationBarView.configureDefault()
    }
    
    private func makeItem1() -> UIView {
        let img = UIImage(systemName: "bell.fill")!
        let button = UIImageView(image: img)
        button.tintColor = Asset.Colors.primaryText.color
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 26).isActive = true
        return button
    }
    
    private func makeItem2() -> UIView {
        let img = UIImage(systemName: "person.fill")!
        let button = UIImageView(image: img)
        button.tintColor = Asset.Colors.primaryText.color
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 26).isActive = true
        return button
    }
}
