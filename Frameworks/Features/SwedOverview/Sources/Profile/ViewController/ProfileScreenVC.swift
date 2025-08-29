//
//  ProfileScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsLocalization
import Combine

class ProfileScreenVC: RuntimeLocalizedUIViewController {
    // MARK: Properties
    lazy var rootView = ProfileScreenView.RootView()
    let viewModel: ProfileScreenVM
    lazy var dataSource = makeDataSource()
    private var cancelBag = Set<AnyCancellable>()
    private var initialRender = true
    
    // MARK: LifeCycle
    init(viewModel: ProfileScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    public override func loadView() {
        super.loadView()
        view = rootView
    }
}

// MARK: Methods
extension ProfileScreenVC {
    private func setup() {
        runtimeLocalizedTitleKey = AppStrings.Screen.User.titleKey
        configureNavBar()
        rootView.tableView.dataSource = dataSource
        bindOutput()
        viewModel.viewDidLoad()
    }
    
    private func configureNavBar() {
        let image = UIImage(systemName: "xmark")
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        customView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let item = UIBarButtonItem(customView: customView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClose))
        customView.addGestureRecognizer(tapGesture)
        navigationItem.leftBarButtonItem = item
    }
    
    @objc private func onClose() {
        dismiss(animated: true)
    }
    
    private func bindOutput() {
        viewModel.sectionsChangePublisher
            .receiveOnMainThread()
            .sink { [weak self] snapshot in
                guard let self = self else { return }
                applyChanges(changeSnapshot: snapshot)
            }
            .store(in: &cancelBag)
    }
    
    private func applyChanges(changeSnapshot: ProfileScreenSectionChangeSnapshot) {
        let sections = changeSnapshot.sections
        let changeSet = changeSnapshot.changes
        var snapshot = NSDiffableDataSourceSnapshot<ProfileScreenSection.SectionID, Int>()
        snapshot.appendSections(sections.map{$0.id})
        sections.forEach { section in
            snapshot.appendItems(section.cells.map{$0.hashValue}, toSection: section.id)
        }
        snapshot.reloadItems(changeSet.updated)
        dataSource.apply(snapshot, animatingDifferences: !initialRender)
        if initialRender {
            initialRender = false
        }
    }
}
