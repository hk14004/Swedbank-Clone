//
//  UserScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import Foundation
import DevToolsUI

class UserScreenVMImpl: ObservableObject {
    
    var navigationBindings: UserScreenVMNavigationBindings = .init()
    @Published var sections: [UserScreenSection] = []
    var sectionsPublisher: Published<[UserScreenSection]>.Publisher {
        $sections
    }
    
    init() {
        startup()
    }
}

extension UserScreenVMImpl: UserScreenVM {}

// MARK: Private

extension UserScreenVMImpl {
    private func startup() {
        sections = makeSections()
    }
    
    private func makeSections() -> [UserScreenSection] {
        [
            makeUserSection(),
            makeSettingsSection(),
            makePrivacySection()
        ]
    }
    
    private func makeUserSection() -> UserScreenSection {
        return .init(identifier: .privatePerson, title: "Screen.User.Section.Private.title", cells: [
            .navigation(NavigationItem(title: "Nothing", subtitle: "", navigateClosure: {
                
            }))
        ])
    }
    
    private func makeSettingsSection() -> UserScreenSection {
        return .init(identifier: .settings, title: "", cells: [
            .navigation(NavigationItem(title: "Screen.User.Section.Settings.settings", subtitle: "", navigateClosure: {
                [weak self] in self?.navigationBindings.onSettings?()
            }))
        ])
    }
    
    private func makePrivacySection() -> UserScreenSection {
        return .init(identifier: .privacy, title: "Screen.User.Section.Privacy.title", cells: [
            .navigation(NavigationItem(title: "Screen.User.Section.Privacy.privacySettings",
                                       subtitle: "",
                                       navigateClosure: {
                                           [weak self] in self?.navigationBindings.onPrivacy?()
                                       }))
        ])
    }
}
