//
//  OverviewScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import DevToolsCore

public protocol OverviewScreenVMInput {
    func viewDidLoad()
}

public protocol OverviewScreenVMOutput {
    var sections: [OverviewScreenSection] { get }
    var sectionsChangePublisher: PassthroughSubject<DevChangeSet, Never> { get }
    var sectionsReloadPublisher: PassthroughSubject<Void, Never> { get }
}


public protocol OverviewScreenVM: OverviewScreenVMInput, OverviewScreenVMOutput {}

public class DefaultOverviewScreenVM: OverviewScreenVM {
    public var sections: [OverviewScreenSection]
    public var sectionsChangePublisher: PassthroughSubject<DevChangeSet, Never>
    public var sectionsReloadPublisher: PassthroughSubject<Void, Never>
    
    public init() {
        sections = []
        sectionsChangePublisher = .init()
        sectionsReloadPublisher = .init()
    }
}

extension DefaultOverviewScreenVM {
    public func viewDidLoad() {
        sections = [
            OverviewScreenSection.init(id: .overview, title: "title", cells: [
                .cardBalance(.init(id: "1", title: "title 1", text: "text 1")),
                .cardBalance(.init(id: "2", title: "title 2", text: "text 2")),
            ])
        ]
    }
}
