//
//  LockedTabScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI

class LockedTabScreenVMImpl {
    
    // MARK: Properties
    
    // Public
    var tabDescriptionIconName: String
    var title: String
    var subtitle: String
    var backgroundColorName: String
    var navigationBindings: LockedTabScreenVMNavigationBindings = .init()
    
    // MARK: Init
    
    init(tabDescriptionIconName: String, title: String, subtitle: String, backgroundColorName: String) {
        self.tabDescriptionIconName = tabDescriptionIconName
        self.title = title
        self.subtitle = subtitle
        self.backgroundColorName = backgroundColorName
    }
}

extension LockedTabScreenVMImpl: LockedTabScreenVM {
    func onLanguageChangeTap() {
        navigationBindings.onGoToLanguageChange?()
    }
    
    func onAuthTapped() {
        navigationBindings.onLoggedIn?()
    }
}
