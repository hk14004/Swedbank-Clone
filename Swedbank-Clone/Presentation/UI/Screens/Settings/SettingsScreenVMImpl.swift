//
//  SettingsScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import Foundation
import DevToolsUI

class SettingsScreenVMImpl: ObservableObject {
    
    var coordinator: SettingsScreenCoordinator
    @Published var sections: [SettingsScreenSection] = []
    var sectionsPublisher: Published<[SettingsScreenSection]>.Publisher {
        $sections
    }
    
    init(coordinator: SettingsScreenCoordinator) {
        self.coordinator = coordinator
        startup()
    }
}

extension SettingsScreenVMImpl: SettingsScreenVM {}

// MARK: Private

extension SettingsScreenVMImpl {
    private func startup() {
        sections = makeSections()
    }
    
    private func makeSections() -> [SettingsScreenSection] {
        [
            makeLanguageSection()
        ]
    }
    
    private func makeLanguageSection() -> SettingsScreenSection {
        return .init(identifier: .language, title: "Language", cells: [
            .navigation(NavigationItem(title: "Latviešu", subtitle: "", navigateClosure: { [weak self] in self?.coordinator.goToLanguage()}))
        ])
    }
}
