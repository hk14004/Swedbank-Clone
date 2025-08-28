//
//  ProfileScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import DevToolsCore
import SwedApplication

protocol ProfileScreenVMInput {
    func viewDidLoad()
    func onLogoutTapped()
}

protocol ProfileScreenVMOutput {
    var router: ProfileScreenRouter! { get set }
    var sections: [ProfileScreenSection] { get }
    var sectionsChangePublisher: PassthroughSubject<ProfileScreenSectionChangeSnapshot, Never> { get }
}

protocol ProfileScreenVM: ProfileScreenVMInput, ProfileScreenVMOutput {}

class DefaultProfileScreenVM: ProfileScreenVM {
    public var router: ProfileScreenRouter!
    public var sections: [ProfileScreenSection]
    public let sectionsChangePublisher: PassthroughSubject<ProfileScreenSectionChangeSnapshot, Never>
    private let logoutUseCase: LogoutUseCase
    private var cancelBag = Set<AnyCancellable>()
    
    public init(logoutUseCase: LogoutUseCase) {
        self.logoutUseCase = logoutUseCase
        self.sections = []
        self.sectionsChangePublisher = .init()
    }
}

extension DefaultProfileScreenVM {
    func viewDidLoad() {
        let new: [ProfileScreenSection] = [
            .init(id: .privatePerson, title: "", cells: [
                .logout
            ])
        ]
        sections = new
        let change = DevHashChangeSet.calculateCellChangeSet(old: [], new: sections)
        sectionsChangePublisher.send(.init(sections: sections, changes: change))
    }
    
    func onLogoutTapped() {
        logoutUseCase.use()
            .receiveOnMainThread()
            .sink { [weak self] _ in
                self?.router.routeToSplashScreen()
            }
            .store(in: &cancelBag)
    }
}
