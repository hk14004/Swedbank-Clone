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
            makeUserSection()
        ]
    }
    
    private func makeUserSection() -> UserScreenSection {
        return .init(identifier: .privatePerson, title: "Private person", cells: [
            .navigation(NavigationItem(title: "Settings", subtitle: "", navigateClosure: {
                [weak self] in self?.navigationBindings.onSettings?()
            }))
        ])
    }
    
    private func makePrivacySection() -> UserScreenSection {
        return .init(identifier: .privacy, title: "privacy", cells: [
        ])
    }
}
