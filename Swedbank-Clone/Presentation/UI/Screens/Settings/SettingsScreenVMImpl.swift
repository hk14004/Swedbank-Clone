//
//  SettingsScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 19/06/2023.
//

import Foundation
import DevToolsUI
import DevToolsLocalization

class SettingsScreenVMImpl: ObservableObject {
    
    @Published var language: String = RuntimeStringFileLocalization.shared.getCurrentLanguage()
    
    var navigationBindings = SettingsScreenVMNavigationBindings()
    @Published var sections: [SettingsScreenSection] = []
    var sectionsPublisher: Published<[SettingsScreenSection]>.Publisher {
        $sections
    }
    
    init() {
        startup()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension SettingsScreenVMImpl: SettingsScreenVM {}

// MARK: Private

extension SettingsScreenVMImpl {
    private func startup() {
        sections = makeSections()
        observe()
    }
    private func observe() {
        RuntimeStringFileLocalization.shared.observeLanguage(observer: self, selector: #selector(onLanguageChanged))
    }
    
    private func makeSections() -> [SettingsScreenSection] {
        [
            makeLanguageSection(),
            makeUserDataSection(),
            makeAppFeaturesSection()
        ]
    }
    
    private func makeLanguageSection() -> SettingsScreenSection {
        return .init(identifier: .language, title: "Screen.Settings.Section.Language.title", cells: [
            .currentLanguage(NavigationItem(title: "", subtitle: "", navigateClosure: { [weak self] in
                self?.navigationBindings.onLanguage?()
            }))
        ])
    }
    
    private func makeUserDataSection() -> SettingsScreenSection {
        return .init(identifier: .userData, title: "Screen.Settings.Section.UserData.title", cells: [
            .navigation(NavigationItem(title: "Screen.Settings.Section.UserData.rememberUser", subtitle: "", navigateClosure: {
                
            })),
            .deleteProfile(NavigationItem(title: "Screen.Settings.Section.UserData.deleteUserData", subtitle: "", navigateClosure: {
                
            }))
        ])
    }
    
    private func makeAppFeaturesSection() -> SettingsScreenSection {
        return .init(identifier: .appFeatures, title: "Screen.Settings.Section.AppFeatures.title", cells: [
            .navigation(NavigationItem(title: "Screen.Settings.Section.AppFeatures.authMethods", subtitle: "", navigateClosure: {
                
            })),
            .navigation(NavigationItem(title: "Screen.Settings.Section.AppFeatures.widget", subtitle: "", navigateClosure: {
                
            })),
            .navigation(NavigationItem(title: "Screen.Settings.Section.AppFeatures.notifications", subtitle: "", navigateClosure: {
                
            }))
        ])
    }
    
    @objc private func onLanguageChanged() {
        sections.update(section: makeLanguageSection())
    }
    
}
