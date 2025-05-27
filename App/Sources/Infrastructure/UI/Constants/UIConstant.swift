//
//  UIConstant.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit

enum UIConstant {}

extension UIConstant {
    enum NavigationBar {
        static let barButtonSize: CGFloat = 32
        static let barButtonIconSize: CGFloat = 28
    }
}

extension UIConstant {
    enum Button {
        static let highlightAlpha: CGFloat = 0.5
        static let defaultAlpha: CGFloat = 1
        static let cornerRadius: CGFloat = 16
    }
}

extension UIConstant {
    enum Tabbar {
        static let shadowColor: UIColor = .gray
        static let shadowOpacity: Float = 0.08
        static let shadowRadius: CGFloat = 6
        static let shadowOffset: CGSize = CGSize(width: 0, height: -2)
    }
}

extension UIConstant {
    enum TableView {
        static let updateDebounce = 300
    }
}

