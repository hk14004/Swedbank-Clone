//
//  ProfileScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsLocalization
import SwedInterfaceAdapters

class ProfileScreenVC: RuntimeLocalizedUIViewController {
    
    private let viewModel: ProfileScreenVM
    
    init(viewModel: ProfileScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setup()
    }
}

extension ProfileScreenVC {
    private func setup() {
        runtimeLocalizedTitleKey = "Screen.User.title"
        configureNavBar()
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
}
