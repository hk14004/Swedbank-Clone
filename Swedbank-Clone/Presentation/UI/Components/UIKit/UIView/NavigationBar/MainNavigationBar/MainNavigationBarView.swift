//
//  MainNavigationBarView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import UIKit
import DevToolsUI
import DevToolsCore
import DevToolsLocalization
import DevToolsNavigation

class MainNavigationBarView: UIView, StoryboardLoadableView {
    
    // MARK: Properties
    
    @IBOutlet private weak var buttonStackView: UIStackView!
    @IBOutlet private weak var titleLabelView: RuntimeLocalizedLabel!
    var loadedXibView: UIView!
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonXibInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonXibInit()
    }
    
}

// MARK: Public

extension MainNavigationBarView {
    func populateStackView(itemBuilder: (UIStackView)->()) {
        buttonStackView.subviews.forEach({$0.removeFromSuperview()})
        itemBuilder(buttonStackView)
    }
    
    func updateTitle(key: String) {
        titleLabelView.runtimeLocalizedKey = key
    }
    
    func viewDidLoad() {
        titleLabelView.textColor = Asset.Colors.headlineText.color
        titleLabelView.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    func configureDefault() {
        func makeItem1() -> UIView {
            let img = UIImage(systemName: "bell.fill")!
            let button = UIButton(configuration: .plain())
            button.setImage(img, for: .normal)
            button.tintColor = Asset.Colors.primaryText.color
            button.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 26).isActive = true
            button.addTarget(self, action: #selector(handleBellTap), for: .touchUpInside)
            return button
        }
        func makeItem2() -> UIView {
            let img = UIImage(systemName: "person.fill")!
            let button = UIButton(configuration: .plain())
            button.setImage(img, for: .normal)
            button.tintColor = Asset.Colors.primaryText.color
            button.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 26).isActive = true
            button.addTarget(self, action: #selector(handleProfileTap), for: .touchUpInside)
            return button
        }
        
        let item1 = makeItem1()
        buttonStackView.addArrangedSubview(item1)
        let item2 = makeItem2()
        buttonStackView.addArrangedSubview(item2)
        buttonStackView.setCustomSpacing(16, after: item1)
    }
}

// MARK: Private

extension MainNavigationBarView {
    @objc private func handleBellTap() {
        guard let topVC = UIViewController.getTopViewController() else {
            return
        }
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .green
        topVC.present(vc, animated: true)
    }
    
    @objc private func handleProfileTap() {
        guard let topVC = UIViewController.getTopViewController() else {
            return
        }
        
        let navVC = UINavigationController()
        let c = DI.container.resolve(UserCoordinator.self, argument: navVC)!
        c.start()
        topVC.present(navVC, animated: true)
    }
}
