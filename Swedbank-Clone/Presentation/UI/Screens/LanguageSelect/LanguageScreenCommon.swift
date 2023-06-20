//
//  LanguageScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import Foundation
import DevToolsUI
import DevToolsCore

class LanguageScreenVMNavigationBindings {
    var onSelected: VoidCallback?
}

protocol LanguageScreenVM: ObservableObject {
    var navigationBindings: LanguageScreenVMNavigationBindings { get }
    var sections: [LanguageScreenSection] { get }
    var sectionsPublisher: Published<[LanguageScreenSection]>.Publisher { get }
    
    func onSelectedLanguage(code: String)
}

class LanguageScreenSection: UISectionModel {
        
    enum Identifier: String, CaseIterable {
        case selectLanguage
    }
    
    enum Cell: Hashable {
        case language(LanguageScreenItem)
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

struct LanguageScreenItem: Equatable, Hashable {
    let flagName: String
    let title: String
    let languageCode: String
    let selected: Bool
}
