//
//  ProfileIconView.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 29/04/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit

class CustomerInitialsView: UIView {
    // MARK: Properties
    private var label: UILabel = {
        let view = UILabel()
        view.textColor = AppColors.text1Inverse.color
        view.font = AppTypography.body.scaledFont
        view.textAlignment = .center
        return view
    }()
    private var circle: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.text2.color
        return view
    }()
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circle.layer.cornerRadius = circle.frame.size.width / 2
        circle.clipsToBounds = true
    }
    
    // MARK: Methods
    private func setup() {
        backgroundColor = .clear
        setupCircleView()
        setupLabel()
    }
    
    private func setupCircleView() {
        addSubview(circle)
        circle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(UIConstant.NavigationBar.barButtonIconSize)
        }
    }
    
    private func setupLabel() {
        circle.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(text: String) {
        label.text = text
    }
}
