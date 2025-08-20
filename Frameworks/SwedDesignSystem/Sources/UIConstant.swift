//
//  UIConstant.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit

public enum UIConstant {}

public extension UIConstant {
    enum View {
        public static let cornerRadius: CGFloat = 16
        public static let defaultPadding: CGFloat = 16
    }
    
    enum NavigationBar {
        public static let barButtonSize: CGFloat = 32
        public static let barButtonIconSize: CGFloat = 28
    }
}

public extension UIConstant {
    enum Button {
        public static let highlightAlpha: CGFloat = 0.5
        public static let defaultAlpha: CGFloat = 1
        public static let cornerRadius: CGFloat = 16
        public static let minHeight: CGFloat = 44
    }
}

public extension UIConstant {
    enum Tabbar {
        public static let shadowColor: UIColor = .gray
        public static let shadowOpacity: Float = 0.08
        public static let shadowRadius: CGFloat = 6
        public static let shadowOffset: CGSize = CGSize(width: 0, height: -2)
    }
}

public extension UIConstant {
    enum TableView {
        public static let updateDebounce = 300
    }
}

