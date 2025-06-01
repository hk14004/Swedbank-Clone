//
//  ProfileScreenView+LogoutCell.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 31/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsLocalization
import Combine

extension ProfileScreenView {
    class LogoutCell: UITableViewCell {
        // MARK: Properties
        lazy var logoutButton: PrimaryButton = {
            let view = PrimaryButton()
            view.runtimeLocalizedKey = AppStrings.Globals.logoutKey
            view.backgroundColor = AppColors.orange3.color
            view.setTitleColor(AppColors.red1.color, for: .normal)
            view.titleLabel?.font = AppTypography.title.scaledFont
            return view
        }()
        var cancelBag = Set<AnyCancellable>()
        
        // MARK: Lifecycle
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            cancelBag.removeAll()
        }
        
        // MARK: Private
        private func setup() {
            setupButton()
        }
        
        private func setupButton() {
            contentView.addSubview(logoutButton)
            logoutButton.snp.makeConstraints { make in
                make.edges.equalTo(contentView.layoutMarginsGuide)
                make.height.greaterThanOrEqualTo(UIConstant.Button.minHeight)
            }
        }
    }
}
