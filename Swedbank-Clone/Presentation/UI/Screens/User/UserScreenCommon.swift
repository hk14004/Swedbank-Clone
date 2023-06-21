//
//  UserScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import Foundation
import DevToolsUI
import DevToolsCore

class UserScreenVMNavigationBindings {
    var onSettings: VoidCallback?
    var onPrivacy: VoidCallback?
}

protocol UserScreenVM: ObservableObject {
    var navigationBindings: UserScreenVMNavigationBindings { get }
    var sections: [UserScreenSection] { get }
    var sectionsPublisher: Published<[UserScreenSection]>.Publisher { get }
}

class UserScreenSection: UISectionModel {
    
    enum Identifier: String, CaseIterable {
        case privatePerson
        case settings
        case privacy
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
