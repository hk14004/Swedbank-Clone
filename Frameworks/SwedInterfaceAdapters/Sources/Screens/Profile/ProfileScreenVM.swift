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

public protocol ProfileScreenVMInput {
    func viewDidLoad()
    func onLogoutTapped()
}

public protocol ProfileScreenVMOutput {
    var sections: [ProfileScreenSection] { get }
    var sectionsChangePublisher: PassthroughSubject<ProfileScreenSectionChangeSnapshot, Never> { get }
}

public protocol ProfileScreenVM: ProfileScreenVMInput, ProfileScreenVMOutput {}

public class DefaultProfileScreenVM: ProfileScreenVM {
    public var sections: [ProfileScreenSection]
    public var sectionsChangePublisher: PassthroughSubject<ProfileScreenSectionChangeSnapshot, Never>
    
    public init() {
        self.sections = []
        self.sectionsChangePublisher = .init()
    }
    
    public func viewDidLoad() {
        let new: [ProfileScreenSection] = [
            .init(id: .privatePerson, title: "222", cells: [
                .navigation(.init(title: "1", subtitle: "2", navigateClosure: {})),
                .logout
            ])
        ]
        sections = new
        let change = DevHashChangeSet.calculateCellChangeSet(old: [], new: sections)
        sectionsChangePublisher.send(.init(sections: sections, changes: change))
    }
    
    public func onLogoutTapped() {
        print("logout plz")
    }
}
