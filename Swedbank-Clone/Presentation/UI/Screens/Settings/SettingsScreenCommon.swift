//
//  SettingsScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import Foundation
import DevToolsUI
import DevToolsCore
import DevToolsNavigation

protocol SettingsScreenCoordinator: NavigationCoordinator {
    func goToLanguage()
}

protocol SettingsScreenVM: ObservableObject {
    var coordinator: SettingsScreenCoordinator { get }
    var sections: [SettingsScreenSection] { get }
    var sectionsPublisher: Published<[SettingsScreenSection]>.Publisher { get }
}

class SettingsScreenSection: UISectionModel {
        
    enum Identifier: String, CaseIterable {
        case language
        case userData
        case appFeatures
    }
    
    enum Cell: Hashable {
        case navigation(NavigationItem)
    }
    
    let identifier: Identifier
    var title: String
    var cells: [Cell]
    
    init(identifier: Identifier, title: String, cells: [Cell]) {
        self.identifier = identifier
        self.title = title
        self.cells = cells
    }
    
}
