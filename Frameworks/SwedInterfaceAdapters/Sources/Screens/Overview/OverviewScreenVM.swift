//
//  OverviewScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol OverviewScreenVMInput {
    func viewDidLoad()
}

public protocol OverviewScreenVMOutput {
    var sectionPublisher: CurrentValueSubject<[OverviewScreenSection], Never> { get }
}


public protocol OverviewScreenVM: OverviewScreenVMInput, OverviewScreenVMOutput {}

public class DefaultOverviewScreenVM: OverviewScreenVM {
    public var sectionPublisher: CurrentValueSubject<[OverviewScreenSection], Never>
    
    public init() {
        sectionPublisher = .init([])
    }
}

extension DefaultOverviewScreenVM {
    public func viewDidLoad() {
        sectionPublisher.value = [
            .init(identifier: .overview, title: "title", cells: [.cardBalance, .expenses ,.offer])
        ]
    }
}
