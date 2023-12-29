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

public struct OverviewScreenSectionChangeSnapshot {
    public let sections: [OverviewScreenSection]
    public let changes: DevHashChangeSet
}

public protocol OverviewScreenVMOutput {
    var sections: [OverviewScreenSection] { get }
    var sectionsChangePublisher: PassthroughSubject<OverviewScreenSectionChangeSnapshot, Never> { get }
}

public protocol OverviewScreenVM: OverviewScreenVMInput, OverviewScreenVMOutput {}

public class DefaultOverviewScreenVM: OverviewScreenVM {
    public var sections: [OverviewScreenSection]
    public var sectionsChangePublisher: PassthroughSubject<OverviewScreenSectionChangeSnapshot, Never>
    
    public init() {
        sections = []
        sectionsChangePublisher = .init()
    }
}

extension DefaultOverviewScreenVM {
    public func viewDidLoad() {
        sections = [
            OverviewScreenSection.init(id: .overview, title: "title", cells: [
                .cardBalance(.init(iban: "LV16HABA123456789", amount: 19120.44, currencyCode: "eur"))
            ])
        ]
        let change = DevHashChangeSet.calculateCellChangeSet(old: [], new: sections)
        sectionsChangePublisher.send(.init(sections: sections, changes: change))
    }
}
